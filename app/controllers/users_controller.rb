class UsersController < ApplicationController
	
	
	def index
		@available_users = User.where.not(status: :archived)
		authorize @available_users
	end
	
	def new
		@user = User.new
		authorize @user
	end
	
	def create
		@user = User.new(user_params)
		authorize @user
		if validate_user? @user
			if @user.save
				flash[:success] = "Your account has been created successfully. Please activate your account through the activation URL sent to your email."
				redirect_to login_path
				UserMailer.activation(@user).deliver_now
			else
				flash[:danger] = "Failed to create user. Please contact the site administrator."
				redirect_to signup_path
			end
		end

	end
	
	def load_archived
		@archived_users = Users.where(:status, :archived)
	end
	
	def edit
		@user = User.find(params[:id])
		authorize @user
	end
	
	def update
		@user = User.find(params[:id])
		authorize @user
		@user.assign_attributes(update_basic_params)
		if !@user.update(update_basic_params) 
			flash.now[:danger] = "Failed to update user. Please check your submission."
		else
			flash.now[:success] = "User successfully updated!"
		end
		render 'edit', status: @user.errors.empty? ? :ok : :bad_request
	end
	
	def activate
		@user = User.find(params[:id])
		authorize @user		
		case @user.status.to_sym
		when :preactive
			if @user.update_attribute(:status, :active)
				render json: @user, status: :ok
				return
			end
		when :active
			render json: @user, status: :ok
			return
		when :archived
			render json: "#{@user.summary} is no longer valid. Please create a new account or sign in with another.", status: :unauthorized
			return
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
	def update_basic_params
		params.require(:user).permit(:username, :first_name, :last_name)
	end

end
