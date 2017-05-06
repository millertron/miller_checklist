class API::V1::AuthenticationController < API::APIController

	def create
		user = User.find_by_username(request.headers["HTTP_AUTH_ID"])
		if user && user.authenticate(request.headers["HTTP_AUTH_KEY"])
			user_details = "User account: #{user.first_name} #{user.last_name} (#{user.username})"
			case user.status.to_sym
			when :preactive
				render json: "#{user_details} has not yet been activated. Please complete the activation process.", status: :unauthorized
			when :active
				render json: user, status: :ok
			when :archived
				render json: "#{user_details} is no longer valid. Please create a new account or sign in with another.", status: :unauthorized
			end
		else
			render json: 'Bad credentials', status: :unauthorized
		end
		
	end
	
	private
	def authentication_params
		params.permit(:id, :key)
	end
end
