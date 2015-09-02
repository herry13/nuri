#!/usr/bin/env ruby

require 'etc'
require 'safe_yaml'

SafeYAML::OPTIONS[:default_mode] = :safe

# Module contains RESTful API implementation of Nuri Planner as a Service
module NuriWebService
  Config = YAML.load File.read("#{File.dirname(__FILE__)}/../etc/config.yaml")

  # Solve every unsolvable problem
  class Scheduler
    def log(level, message)
      File.open(Config['worker']['log_file'], 'a') do |f|
        f.write "#{Time.now} #{level} #{message}\n"
      end
    end

    def run
      loop do
        scan
        sleep Config['planner']['sleep_time']
      end
    end

    def build_command(id)
      cmd = "cd #{problem_dir(id)} && "
      cmd << "ulimit -Sv #{Config['planner']['max_memory']} && "
      cmd << "timeout #{Config['planner']['timeout']}s "
      cmd << "#{Config['planner']['path']} #{initial_file} #{goal_file}"
      cmd
    end

    def initial_file
      "initial.nuri"
    end

    def goal_file
      "goal.nuri"
    end

    def problems_dir
      Config['problems']['cachedir']
    end

    def problem_dir(id)
      "#{problems_dir}/#{id}"
    end

    def plan_file(id)
      "#{problem_dir(id)}/plan.json"
    end

    def log_file(id)
      "#{problem_dir(id)}/output.log"
    end

    def open_problem?(id)
      id[0] != '.' && File.directory?(problem_dir(id)) &&
        !File.exist?(log_file(id)) && !File.exist?(plan_file(id))
    end

    def scan
      Dir.entries(problems_dir).each do |id|
        next unless open_problem? id
        begin
          system build_command(id)
          log :INFO, "Planning problem: #{id} [OK]"
        rescue Exception => e
          log :INFO, "Planning problem: #{id} [Failed]"
          File.open(log_file, 'w') do |f|
            f.write e.to_s
          end unless File.exist?(log_file(id))
        end
      end if File.directory? problems_dir
    end
  end
end

case ARGV[0]
when '-d', '--daemon'
  # get user ID
  user = NuriWebService::Config['worker']['user']
  u = (user.is_a? Integer) ? Etc.getpwuid(user) : Etc.getpwnam(user)
  # switch user and group
  Process.uid = u.uid
  Process.gid = u.uid
  Process::UID.switch
  Process::GID.switch
  # daemonize this process
  Process.daemon
  # trap -HUP signal
  Signal.trap 'HUP' do
    FileUtils.rm_f NuriWebService::Config['worker']['pid_file']
    exit true
  end
  # save PID to file
  File.open NuriWebService::Config['worker']['pid_file'], 'w' do |f|
    f.write Process.pid
  end
  # activate scheduler
  NuriWebService::Scheduler.new.run
else
  Signal.trap 'INT' do
    puts 'exiting...'
    exit true
  end

  NuriWebService::Scheduler.new.run
end
