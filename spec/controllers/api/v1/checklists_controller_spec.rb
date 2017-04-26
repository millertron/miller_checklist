require 'spec_helper'

describe API::V1::ChecklistsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	
	describe "GET 'index'" do
		it "returns a successful 200 response" do
			get :index, format: :json
			expect(response).to be_success
		end
		
		it "returns all the checklists" do
			FactoryGirl.create(:checklist, owner: :user, name: "Checklist 1", frequency: :daily)
		end
	end
end