class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  
  helper_method :current_user
  
  def current_user
	@current_user ||= User.find_by(id: session[:user_id], status: :active) if session[:user_id]
  end
  
  def require_user
	redirect_to login_path unless current_user
  end
  
  def require_null_user
	redirect_to root_path if current_user
  end
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render file: "unauthorized", status: :unauthorized
  end
end
