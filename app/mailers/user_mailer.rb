class UserMailer < ApplicationMailer
	def activation user
		@user = user
		mail to: ENV["DEV_MAIL_OVERRIDE"] || @user.email, subject: "MUTEX Notification: User account activation"
	end
end
