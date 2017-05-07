class UserMailer < ApplicationMailer
	def activation user
		@user = user
		mail to: @user.email, subject: "User account activation"
	end
end
