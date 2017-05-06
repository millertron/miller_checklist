require 'spec_helper'

RSpec.describe API::V1::AuthenticationController, type: :controller do
	let (:user) {FactoryGirl.create(:user)}
	
	context "GET #edit" do
		context "with valid login credentials" do
			context "for pre-active user" do
				before do
					user.update_attribute(:status, :preactive)
					get "edit", params: {:id => user.username, :key => user.password}, format: :json
				end
				it {should respond_with(:unauthorized)}
			end
			
			context "for active user" do
				before do
					user.update_attribute(:status, :active)
					get "edit", params: {:id => user.username, :key => user.password}, format: :json
				end
				it {should respond_with(:ok)}
				
			end
			
			context "for archived user" do
				before do
					user.update_attribute(:status, :archived)
					get "edit", params: {:id => user.username, :key => user.password}, format: :json
				end
				it {should respond_with(:unauthorized)}
			end
		end
		
		context "with invalid login credentials" do
			it "should respond with unauthorized error" do
				get "edit", params: {:id => user.username, :key =>"#{user.password}blahblahblah"}, format: :json
			end
		end
	end
end
