require 'spec_helper'

describe API::V1::ChecklistsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:other_user) { FactoryGirl.create(:user) }
	let(:user_params) { {owner_id: user.id} }
	context "token authenticated with API key" do

		before { request.env["HTTP_AUTHORIZATION"] = token_header(user.api_key) }
		
		describe "GET 'index'" do
			
			it "requires a user ID parameter" do
				get :index, format: :json
				expect(response).to be_unprocessable
			end
			
			context "with valid user params" do		
				it "returns a successful 200 response" do
					get :index, params: user_params, format: :json
					expect(response).to be_success
				end
				
				it "returns a response type of application/json" do
					get :index, params: user_params, format: :json
					expect(response.content_type).to eq Mime[:json]
				end
				
				it "returns only the user's checklists" do
					FactoryGirl.create(:checklist, owner: user)
					FactoryGirl.create(:checklist, owner: other_user)
					get :index, params: user_params, format: :json
					expect(response.body).to eq Checklist.where(owner_id: user.id).to_json
				end
			end
		end
	
	end
	
end