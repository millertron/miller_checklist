class User < ApplicationRecord
	
	enum status: { preactive: 0, active: 1, archived: 2 }, _suffix: true
	
	before_create do |doc|
		doc.api_key = doc.generate_api_key
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
	validates :password, presence: true
	
	def generate_api_key
		loop do
			token = SecureRandom.base64.tr('+/=', 'Qrt')
			break token unless User.exists?(api_key: token)
		end
	end
end
