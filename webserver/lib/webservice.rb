require 'grape'
require 'json'
require 'digest'
require 'securerandom'
require 'redis'
require 'net/smtp'
require 'net/http'
require 'uri'
require 'ostruct'
require 'erb'
require 'base64'
require 'safe_yaml'

SafeYAML::OPTIONS[:default_mode] = :safe

# Module contains RESTful API implementation of Nuri Planner as a Service.
module NuriWebService
  Config = YAML.load File.read("#{File.dirname(__FILE__)}/../etc/config.yaml")

  module Util
    def self.new_id
        "#{(Time.now.to_f).to_i}#{(Random.rand * 1_000).to_i}".to_i.to_s(16)
    end
  end

  class PlannerAPI < Grape::API
    version 'v1', vendor: 'nurilabs', using: :header
    format :json

    get ':id', requirements: { id: /[0-9a-zA-Z]+/ } do
      dir = "#{Config['problems']['cachedir']}/#{params[:id]}"
      if File.directory? dir
        plan_file = "#{dir}/plan.json"
        if File.file? plan_file
          plan = File.read(plan_file).strip
          case plan
          when '', nil, 'null'
            { plan: nil, message: 'Solution plan was not found.' }
          else
            { plan: JSON.parse(plan), message: 'Soltion plan was found.' }
          end
        else
          status 202
          { message: 'Planning has not finished.' }
        end
      else
        status 404
        { message: 'Invalid id.' }
      end
    end

    delete ':id', requirements: { id: /[0-9a-zA-Z]+/ } do
      dir = "#{Config['problems']['cachedir']}/#{params[:id]}"
      status 404 unless File.directory? dir
      if status == 200
        begin
          FileUtils.rm_r dir
          { message: 'Problem has been deleted.' }
        rescue
          status 500
        end
      end
    end

    params do
      requires :initial, type: String, desc: 'Specification of initial state.'
      requires :goal, type: String, desc: 'Specification of goal state.'
      requires :type, type: String, regexp: /^(nuri|json)$/,
               desc: 'Type of specification.'
    end
    post do
      id = Util.new_id
      dir = "#{Config['problems']['cachedir']}/#{id}"
      begin
        FileUtils.mkdir_p dir
        ext = ".#{params['type']}"
        params.each do |key, value|
          case key
          when 'route_info', 'type'
          else
            File.open("#{dir}/#{key}#{ext}", 'w') { |f| f.write value }
          end
        end
        { 'problem-id' => id, message: 'The problem was created.' }
      rescue
        status 500
        { message: 'Cannot create the problem.' }
      end
    end
  end

  # A class that represents a client (user)
  class Client
    attr_reader :id

    def initialize(params)
      @id = params[:id]
      @redis = params[:redis]
    end

    def salted(password)
      password + Config['user']['digest_salt']
    end

    def digest(password)
      Digest::SHA256.base64digest salted(password)
    end

    def key
      "client|#{@id}|profile"
    end

    def exists
      @redis.exists key
    end

    def password
      @redis.hget key, 'password'
    end

    def password=(pass)
      @redis.hset key, 'password', digest(pass)
    end

    def valid_password?(pass)
      password == digest(pass)
    end

    def email_key(client_email)
      "emails|#{client_email}"
    end

    def email_exists(client_email)
      @redis.exists email_key(client_email)
    end

    def email=(client_email)
      @redis.hset(key, 'email', client_email) &&
        @redis.set(email_key(client_email), @id)
    end

    def email
      @redis.hget key, 'email'
    end

    def active?
      @redis.hget(key, 'active') == 'true'
    end

    def active=(active)
      @redis.hset key, 'active', active
      @redis.del activation_token_key if @redis.exists activation_token_key
    end

    def token_key
      "client|#{@id}|token"
    end

    def new_token
      token = Digest::SHA256.digest salted(@id + SecureRandom.hex(32))
      token = Base64.urlsafe_encode64 token
      token.gsub!(/['\+=]/, 'X')
      @redis.set token_key, token
      @redis.expire token_key, Config['user']['token_expire_time']
    end

    def token
      @redis.get token_key
    end

    def token?
      @redis.exists token_key
    end

    def del_token
      @redis.del token_key if token?
    end

    def valid_token?(tok)
       (active? && token? && token == tok)
    end

    def activation_token_key
      "activation|#{@id}|token"
    end

    def new_activation_token
      token = Digest::SHA256.base64digest salted(@id + SecureRandom.hex(32))
      token.gsub!(/[\+=]/, 'X')
      @redis.set activation_token_key, token
      @redis.expire activation_token_key, Config['user']['token_expire_time']
      token
    end

    def activation_token
      @redis.get activation_token_key
    end

    def files_key
      "client|#{@id}|files"
    end

    def files
      (@redis.exists(files_key) ? @redis.hkeys(files_key) : [])
    end

    def file_content(file)
      @redis.hget files_key, file
    end

    def save_file(name, content)
      @redis.hset files_key, name, content
    end

    def delete_file(name)
      @redis.hdel files_key, name
    end

    def save_files_to_directory(dir)
      files.each do |file|
        File.open("#{dir}/#{file}", 'w') { |f|
          f.write file_content(file)
        }
      end
    end

    def planning_key
      "client|#{@id}|planning"
    end

    def add_planning_problem(id)
      @redis.lpush planning_key, id
    end

    def planning_problems(from = 0, to = 10)
      if @redis.exists(planning_key)
        @redis.lrange planning_key, from, to
      else
        []
      end
    end

    def plan
      if files.include?('initial.nuri') && files.include?('goal.nuri')
        id = Util.new_id
        dir = "#{Config['problems']['cachedir']}/#{@id}_#{id}"
        if !File.exist? dir
          FileUtils.mkdir_p dir
          save_files_to_directory dir
          add_planning_problem(id)
          return id
        end
      end
      nil
    end

    # return false  - invalid problem ID
    # return nil    - planning has not finished yet
    # return ''     - no solution
    # return String - solution plan
    def get_plan(id)
      dir = "#{Config['problems']['cachedir']}/#{@id}_#{id}"
      if File.directory? dir
        plan_file = "#{dir}/plan.json"
        if File.file? plan_file
          (File.file?(plan_file) ? File.read(plan_file) : '')
        else
          nil
        end
      else
        false
      end
    end

    def get_plan_graph(id)
      svg_file = "#{Config['problems']['cachedir']}/#{@id}_#{id}/plan.svg"
      (File.file?(svg_file) ? File.read(svg_file) : '')
    end
  end

  # Implement API for user authentication.
  class ClientAPI < Grape::API
    version 'v1', vendor: 'nurilabs', using: :header
    format :json

    helpers do
      def create_redis
        Redis.new(host: Config['redis']['host'], port: Config['redis']['port'],
          password: Config['redis']['pass'])
      end

      def email_activation_template
        File.read Config['email']['account_activation_template']
      end

      def send_activation_email(to, client_id, token)
        data = OpenStruct.new Config['email']
        data.to = to
        data.client_id = client_id
        data.activation_token = token
        msg = ERB.new(email_activation_template)
                .result(data.instance_eval { binding })
        Net::SMTP.start('localhost') do |smtp|
          smtp.send_message msg, data.from, to
        end
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_password,
               type: String,
               regexp: /(([A-Z].*[0-9])|([0-9].*[A-Z]))/
    end
    get :authorize do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.active? && client.valid_password?(params['client_password'])
        client.new_token
        { message: 'Authorization OK.', token: client.token }
      else
        status 401
        { error: 'Invalid client_id or client_password.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
    end
    get :ping do
      client = Client.new id: params['client_id'], redis: create_redis
      if !client.active? || !client.token? ||
          client.token != params['client_token']
        status 403
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
    end
    delete :authorize do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        client.del_token
        { message: 'Removing token OK.' }
      else
        error 403
        { error: 'Invalid token.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
      optional :name, type: String
    end
    get :file do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        if params['name'].nil?
          { files: client.files }
        else
          { content: client.file_content(params['name']) }
        end
      else
        status 403
        { error: 'Invalid token.' }
      end
    end

	params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
      requires :name, type: String, regexp: /^.+$/
    end
    delete :file do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        client.delete_file params['name']
        { message: 'File has been deleted.' }
      else
        status 403
        { error: 'Invalid token.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
      requires :name, type: String, regexp: /^.+$/
      requires :content, type: String
    end
    post :file do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        if !client.files.include?(params['name']) &&
            client.files.length >= Config['user']['max_total_files']
          status 403
          { error: 'Cannot add another file.' }
        else
          client.save_file(params['name'], params['content'])
          { message: 'File has been saved.' }
        end
      else
        status 403
        { error: 'Invalid token.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_password,
               type: String,
               regexp: /(([A-Z].*[0-9])|([0-9].*[A-Z]))/
      requires :client_email,
               type: String,
               regexp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/
    end
    post :signup do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.exists
        status 400
        { error: 'client_id is already exist.' }
      elsif client.email_exists params['client_email']
        status 400
        { error: 'Another client_id has used the email.' }
      else
        client.password = params['client_password']
        client.email = params['client_email']
        client.active = false
        token = client.new_activation_token
        send_activation_email client.email, client.id, token
        { activation_token: token }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :token, type: String
    end
    get :activate do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.exists && !client.active? &&
          client.activation_token == params['token'] &&
        client.active = true
        redirect Config['urls']['login_page']
      else
        status 400
        { error: 'Invalid request.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
    end
    post :plan do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        id = client.plan
        status 500 if id.nil?
        { problem_id: id } if !id.nil?
      else
        status 403
        { error: 'Invalid client_id or client_token.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
      optional :problem_id, type: String, regexp: /^[a-zA-Z0-9_]+$/
    end
    get :plan do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        if params.has_key? 'problem_id'
          plan = client.get_plan(params['problem_id'])
          case plan
          when false
            status 400
          when nil
            status 202
          when ''
            status 404
          else
            { plan: JSON.parse(plan) }
          end
        else
          { problems: client.planning_problems }
        end
      else
        status 403
        { error: 'Invalid client_id or client_token.' }
      end
    end

    params do
      requires :client_id, type: String, regexp: /^[a-zA-Z0-9]{5,}$/
      requires :client_token, type: String
      requires :problem_id, type: String, regexp: /^[a-zA-Z0-9_]+$/
    end
    get :plangraph do
      client = Client.new id: params['client_id'], redis: create_redis
      if client.valid_token? params['client_token']
        { graph: client.get_plan_graph(params['problem_id']), type: :svg }
      else
        status 403
        { error: 'Invalid client_id or client_token.' }
      end
    end
  end

  # API implementation for Grape
  class API < Grape::API
    version 'v1', vendor: 'nurilabs', using: :header
    format :json

    get :ping do
      { nuri: 'Hello!' }
    end

    mount PlannerAPI => '/planner'
    mount ClientAPI => '/user'
  end
end
