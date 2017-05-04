require 'spec_helper'

describe API::V1::ImplementationsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:checklist) {FactoryGirl.build(:checklist, owner: user)}
	let(:checklist_item) {FactoryGirl.build(:checklist_item, checklist: checklist,value_type: :binary)}
	let(:valid_params) { {implementation: { implementor_id: user.id, checklist_id: checklist.id, implementation_items: [{ binary_value: true, text: checklist_item.text }]} }}
	
	context "when token authenticated with API key" do

		before do
			request.env["HTTP_AUTHORIZATION"] = token_header(user.api_key) 
			checklist.checklist_items << checklist_item
			checklist.save
		end
			
		
		describe "POST #create" do
			
			context "with valid implementation params" do
			
				it "successfully creates a checklist implementation" do
					post :create, params: valid_params, format: :json
				
					expect(response).to have_http_status(:created)
					
				end
				
				it "returns ok if checklist was already implemented - does not create another" do
					post :create, params: valid_params, format: :json 
					post :create, params: valid_params, format: :json
					
					expect(response).to be_success
					expect(response).to have_http_status(:ok)
					expect(Implementation.all.size).to eq 1
				end
			
			end
			
			it "with no checklist ID returns bad request" do
				post :create, params: valid_params.merge({implementation: {checklist_id: nil}}), format: :json					
				expect(response).to have_http_status(:bad_request)				
			end

		end
		
	end
end
