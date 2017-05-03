class API::APIController < ActionController::Base

	private
	def authenticate
		authenticate_token || render_unauthorized
	end
	
	def authenticate_token
		authenticate_or_request_with_http_token do |token, options|
			User.find_by(api_key: token)
		end
	end
	
	def render_unauthorized
		self.headers['WWW-Authenticate'] = 'Token realm="Application"'
		render json: 'Bad credentials', status: 401
	end	

end
