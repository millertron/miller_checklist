class Api::ApiController < ActionController::Base

	private
	def authenticate
		authenticate_token || render_unauthorized
	end
	
	def authenticate_token
		authenticate_or_request_with_http_token do |token, options|
			@user = User.where(api_key: token).first
		end
	end
	
	def render_unauthorized
		self.headers['WWW-Authenticate'] = 'Token realm="Application"'
		render json: 'Bad credentials', status: 401
	end	

end
