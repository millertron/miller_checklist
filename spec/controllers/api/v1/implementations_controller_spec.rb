require 'spec_helper'

describe API::V1::ImplementationsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	context "token authenticated with API key" do
		
		before do
			request.env["HTTP_AUTHORIZATION"] = token_header(user.api_key) 
			checklist = FactoryGirl.build(:checklist)
			checklist_item = FactoryGirl.build(:checklist_item, checklist: checklist,value_type: :binary)
			checklist.checklist_items << checklist_item
			checklist.save
		end
			
		
		describe "POST create" do
			
			it "successfully creates a checklist implementation" do
				#post :create, params: { implementation: { implementor_id: user.id, checklist_id: checklist.id, implementation_items: [{ binary_value: true, text: checklist_item.text }] } }, format: :json
			end
		end
		
	end
end
