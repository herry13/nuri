require 'openssl'

module Nuri
	module SSL

		def self.keygen(priv_key_file=nil, pub_key_file=nil)
			key = OpenSSL::PKey::RSA.new 2048

			if priv_key_file != nil and pub_key_file != nil
				open(priv_key_file, 'w') do |io| io.write(key.to_pem) end
				open(pub_key_file, 'w') do |io| io.write(key.public_key.to_pem) end
			else
				key
			end
		end

		def self.random_string
			o = [('a'..'z'),('A'..'Z')].map { |i| i.to_a }.flatten
			return (0..50).map { o[rand(o.length)] }.join
		end

		def self.get_private_key(priv_key_file=nil)
			priv_key_file = Nuri::Util.home_dir + '/etc/private.pem' if priv_key_file == nil
			raise Exception, 'Private key file is not found' if not File.exists?(priv_key_file)

			@@private = OpenSSL::PKey::RSA.new File.read priv_key_file
			@@private
		end

		def self.private_encrypt(data, key=nil)
			key = @@private if key == nil and defined?(@@private)
			raise Exception, 'Private key is not available.' if key == nil

			key.private_encrypt data
		end

		def self.get_public_key(pub_key_file=nil)
			pub_key_file = Nuri::Util.home_dir + '/etc/public.pem' if pub_key_file == nil
			raise Exception, 'Public key file is not found.' if not File.exists?(pub_key_file)
			@@public = OpenSSL::PKey::RSA.new File.read pub_key_file
			@@public
		end

		def self.public_key_to_s
			pub_key_file = Nuri::Util.home_dir + '/etc/public.pem' if pub_key_file == nil
			raise Exception, 'Public key file is not found.' if not File.exists?(pub_key_file)
			data = nil
			File.open(pub_key_file, 'r') do |f| data = f.read end
			data
		end

		def self.test
			str = Nuri::SSL.random_string
			puts str
			Nuri::SSL.get_private_key
			msg = Nuri::SSL.private_encrypt(str)
			puts msg
			pubkey = Nuri::SSL.get_public_key #(Nuri::Util.home_dir + '/etc/public.pem')
			puts pubkey.public_decrypt msg
		end

	end
end
