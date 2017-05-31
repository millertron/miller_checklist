class ActivationController < ApplicationController
	def edit
		user = User.find_by(:activation_code => params[:id].to_s)
		if !user
			flash[:error] = "No valid user was found from this request"
		else
			user_details = "User account for #{user.first_name} #{user.last_name}"
			case user.status.to_sym
			when :preactive
				user.update_attribute(:status, :active)
				flash[:success] = "#{user_details} has been successfully activated! Please log in to proceed."
			when :active
				flash[:notice] = "#{user_details} is already activated. Please log in to proceed."
			when :locked
				flash[:error] = "#{user_details} has been suspended. Please contact the site administrator."
			when :archived
				flash[:error] = "#{user_details} has been disabled. Please create a new account or log in with another."
			end
		end
		redirect_to login_path
	end

	private
	def activation_params
		params.permit(:id)
	end
end
