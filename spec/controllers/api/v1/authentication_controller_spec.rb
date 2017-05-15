require 'rails_helper'

RSpec.describe API::V1::AuthenticationController, type: :controller do
	let (:user) {FactoryGirl.create(:user)}
	context "POST #create" do
		context "with valid login credentials" do
			before do
				request.env['HTTP_AUTH_ID'] = user.username 
				request.env['HTTP_AUTH_KEY'] = user.password
			end
			context "for pre-active user" do
				before do
					user.update_attribute(:status, :preactive)
					post "create", params: {}, format: :json
				end
				it {should respond_with(:unauthorized)}
				it "should respond with a message that states user account 'has not yet been active'" do
					expect(response.body).to include "has not yet been activated."
				end
			end
			
			context "for active user" do
				before do
					user.update_attribute(:status, :active)
					post "create", params: {}, format: :json
				end
				it {should respond_with(:ok)}
				it "should return the user serialized with id, names, email, status and API key only" do
					user_json = JSON.parse(response.body)
					expect(user_json["id"]).to eq user.id
					expect(user_json["first_name"]).to eq user.first_name
					expect(user_json["last_name"]).to eq user.last_name
					expect(user_json["username"]).to eq user.username
					expect(user_json["email"]).to eq user.email
					expect(user_json["status"]).to eq user.status
					expect(user_json["api_key"]).to eq user.api_key
					expect(user_json["password_digest"]).not_to eq user.password_digest
					expect(user_json["password_digest"]).to eq nil
					expect(user_json["activation_code"]).not_to eq user.activation_code
					expect(user_json["activation_code"]).to eq nil
				end
				
			end
			
			context "for archived user" do
				before do
					user.update_attribute(:status, :archived)
					post "create", params: {}, format: :json
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
				post "create", params: {}, format: :json
			end
		end
	end
end
