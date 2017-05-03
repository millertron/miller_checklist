require 'spec_helper'

describe API::V1::ImplementationsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:checklist) {FactoryGirl.build(:checklist)}
	let(:checklist_item) {FactoryGirl.build(:checklist_item, checklist: checklist,value_type: :binary)}
	
	context "token authenticated with API key" do

	
		before do
			request.env["HTTP_AUTHORIZATION"] = token_header(user.api_key) 
			checklist.checklist_items << checklist_item
			checklist.save
		end
			
		
		describe "POST create" do
			
			it "successfully creates a checklist implementation" do
				post :create, params: { implementation: { implementor_id: user.id, checklist_id: checklist.id, implementation_items: [{ binary_value: true, text: checklist_item.text }] } }, format: :json
			
				expect(response).to have_http_status(:created)
				
			end
			
			it "returns ok if checklist was already implemented - does not create another" do
				post :create, params: { implementation: { implementor_id: user.id, checklist_id: checklist.id, implementation_items: [{ binary_value: true, text: checklist_item.text }] } }, format: :json 
				post :create, params: { implementation: { implementor_id: user.id, checklist_id: checklist.id, implementation_items: [{ binary_value: true, text: checklist_item.text }] } }, format: :json
				
				expect(response).to be_success
				expect(Implementation.all.size).to eq 1
			end

		end
		
	end
end
