class UsersController < ApplicationController
	before_action :require_null_user
	
	def new
		@signup_page = true
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)

		if validate_user? @user
			if @user.save
				flash[:success] = "Your account has been created successfully. Please activate your account through the activation URL sent to your email."
				redirect_to root_path
				UserMailer.activation(@user).deliver_now
			else
				flash[:danger] = "Failed to create user. Please contact the site administrator."
				redirect_to signup_path
			end
		end

	end
	
	def validate_user? (user)
		@error_messages = Array.new
		
		if User.find_by_username(user.username) 
			@error_messages.push("Username already in use - please choose another username.")
		end
		
		unless (user.username && user.first_name && user.last_name && user.password)
			@error_messages.push("Please fill in all required fields.")
		end
		
		unless @error_messages.empty?
			flash[:danger] = "There are errors with your submission: " << @error_messages.join("\n") 
			redirect_to signup_path
			return false
		end
		return true
	end
	
	private
	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
	end

end
