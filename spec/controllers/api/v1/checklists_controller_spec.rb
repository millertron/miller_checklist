require 'rails_helper'

describe API::V1::ChecklistsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:other_user) { FactoryGirl.create(:user) }
	let(:user_params) { {owner_id: user.id} }
	context "when token authenticated with API key" do

		before { request.env["HTTP_AUTHORIZATION"] = token_header(user.api_key) }
		
		describe "GET #index" do
			
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
				
				context "with no frequency params"
				
				it "returns only the user's checklists" do
					my_daily_checklist = FactoryGirl.create(:checklist, owner: user, frequency: :daily) 
					my_weekly_checklist = FactoryGirl.create(:checklist, owner: user, frequency: :weekly) 
					other_guys_checklist = FactoryGirl.create(:checklist, owner: other_user, frequency: :daily)
					get :index, params: user_params, format: :json
					checklists = JSON.parse(response.body, {symbolize_names: true})
					expect(checklists.size).to eq 2
					expect(checklists[0][:id]).to eq my_daily_checklist.id
					expect(checklists[0][:description]).to eq my_daily_checklist.description
					expect(checklists[0][:frequency]).to eq my_daily_checklist.frequency
					expect(checklists[0][:owner_id]).to eq user.id
					expect(checklists[1][:id]).to eq my_weekly_checklist.id
					expect(checklists[1][:description]).to eq my_weekly_checklist.description
					expect(checklists[1][:frequency]).to eq my_weekly_checklist.frequency
					expect(checklists[1][:owner_id]).to eq user.id
				end
				
				context "with a frequency param" do
					it "returns only the user's checklist of the specified frequency" do
						my_daily_checklist = FactoryGirl.create(:checklist, owner: user, frequency: :daily) 
						my_weekly_checklist = FactoryGirl.create(:checklist, owner: user, frequency: :weekly) 
						other_guys_checklist = FactoryGirl.create(:checklist, owner: other_user, frequency: :daily)
						get :index, params: user_params.merge({frequency: :daily}), format: :json
						checklists = JSON.parse(response.body, {symbolize_names: true})
						expect(checklists.size).to eq 1
						expect(checklists[0][:id]).to eq my_daily_checklist.id
						expect(checklists[0][:description]).to eq my_daily_checklist.description
						expect(checklists[0][:frequency]).to eq my_daily_checklist.frequency
						expect(checklists[0][:owner_id]).to eq user.id
					end
					
				end
				
			end
		end
		
	
	end
	
end