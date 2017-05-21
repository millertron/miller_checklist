class NavbarPolicy < Struct.new(:user, :navbar)
	def admin?
		user && user.admin?
	end

	def analytics_enabled?
		ENV["enable_analytics"] == 'true'
	end
	
end