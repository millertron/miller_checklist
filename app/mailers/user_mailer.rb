class UserMailer < ApplicationMailer
	def activation user
		@user = user
		mail to: @user.email, subject: "MUTEX Notification: User account activation"
	end
end
