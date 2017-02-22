class User < ApplicationRecord
	
	before_create do |doc|
		doc.api_key = doc.generate_api_key
	end
	
	has_many :checklists
	has_secure_password
	
	def generate_api_key
		loop do
			token = SecureRandom.base64.tr('+/=', 'Qrt')
			break token unless User.exists?(api_key: token)
		end
	end
end
