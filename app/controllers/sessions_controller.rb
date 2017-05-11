class SessionsController < ApplicationController
  def new
	@login_page = true
  end
  
  def create
	@user = User.find_by_username(params[:session][:username])
	if (@user && @user.active_status? && @user.authenticate(params[:session][:password]))
		session[:user_id] = @user.id
		redirect_to root_path
	else
		flash[:error] = "Failed to log in with credentials provided."
		redirect_to login_path
	end
  end
  
  def destroy
	session[:user_id] = nil
	redirect_to login_path
  end
end
