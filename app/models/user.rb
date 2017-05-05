class User < ApplicationRecord
	
	enum status: { preactive: 0, active: 1, archived: 2 }, _suffix: true
	
	before_create do |doc|
		doc.api_key = doc.generate_secure_token :api_key
		doc.activation_code = doc.generate_secure_token :activation_code
	end
	
	before_save do
		self.username = username.downcase
	end
	
	def initialize
		super
		self.status = :preactive
	end
	
	has_many :checklists
	has_secure_password
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, uniqueness: {case_sensitive: false}
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true
	
	def generate_secure_token attribute 
		loop do
			token = SecureRandom.urlsafe_base64
			break token unless User.exists?(attribute => token)
		end
	end
	
end
