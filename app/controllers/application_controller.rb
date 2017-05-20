class ApplicationController < ActionController::Base
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
end
