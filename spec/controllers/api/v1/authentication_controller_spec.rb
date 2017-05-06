require 'spec_helper'

RSpec.describe API::V1::AuthenticationController, type: :controller do
	let (:user) {FactoryGirl.create(:user)}
	context "GET #create" do
		context "with valid login credentials" do
			before do
				request.env['HTTP_AUTH_ID'] = user.username 
				request.env['HTTP_AUTH_KEY'] = user.password
			end
			context "for pre-active user" do
				before do
					user.update_attribute(:status, :preactive)
					get "create", params: {}, format: :json
				end
				it {should respond_with(:unauthorized)}
				it "should respond with a message that states user account 'has not yet been active'" do
					expect(response.body).to include "has not yet been activated."
				end
			end
			
			context "for active user" do
				before do
					user.update_attribute(:status, :active)
					get "create", params: {}, format: :json
				end
				it {should respond_with(:ok)}
				
			end
			
			context "for archived user" do
				before do
					user.update_attribute(:status, :archived)
					get "create", params: {}, format: :json
				end
				it {should respond_with(:unauthorized)}
				it "should respond with a message that states user account 'is no longer valid'" do
					expect(response.body).to include "is no longer valid."
				end
			end
		end
		
		context "with invalid login credentials" do
			it "should respond with unauthorized error" do
				request.env["auth_id"] = user.username 
				request.env["auth_key"] = "#{user.password}blahblahblah"
				get "create", params: {}, format: :json
			end
		end
	end
end
