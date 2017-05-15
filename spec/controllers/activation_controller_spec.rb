require 'rails_helper'

RSpec.describe ActivationController, type: :controller do

	let(:user){ FactoryGirl.create(:user)}

	context "GET #edit" do
		context "with valid activation code" do
			
			context "for pre-active user" do
				before do 
					user.update_attribute(:status, :preactive)
					get "edit", params: {id: user.activation_code}
				end
				it "redirects to login page with success message" do
					expect(response).to redirect_to login_path
					expect(controller).to set_flash[:success]
				end
				it "changes user status to active" do
					user.reload
					expect(user.status.to_sym).to eq :active
					expect(user.active_status?).to eq true
				end
			end
			
			context "for active user" do
				before do 
					user.update_attribute(:status, :active)
					user.reload
					@updated_at = user.updated_at				
					get "edit", params: {id: user.activation_code}
				end
				it "redirects to login page successfully having changed nothing to active user" do
					user.reload
					expect(response).to redirect_to login_path
					expect(user.updated_at).to eq @updated_at
					expect(controller).to set_flash[:notice]
				end
			end
			context " for archived user" do
				before do 
					user.update_attribute(:status, :archived)
					user.reload
					@updated_at = user.updated_at
					get "edit", params: {id: user.activation_code}
				end
				it "redirects to login page with error having changed nothing to archived user" do
					user.reload
					expect(response).to redirect_to login_path
					expect(user.updated_at).to eq @updated_at
					expect(controller).to set_flash[:error]
				end
			end
		end
		
		it "with invalid token redirects to login page with error" do
			get "edit", params: {id: "#{user.activation_code}blahblahblah"}
			expect(response).to redirect_to login_path
			expect(controller).to set_flash[:error]
		end
	end
end
