require 'spec_helper'

describe API::V1::ChecklistsController, type: :controller do
	let(:user) { FactoryGirl.create(:user, password: "password", password_confirmation: "password") }
	
	describe "GET 'index'" do
		it "returns a successful 200 response" do
			get :index, format: :json
			expect(response).to be_success
		end
		
		it "returns a response type of application/json" do
			get :index, format: :json
			expect(response.header['Content-Type']).to match /json/
		end
		
		it "returns all the checklists" do
			FactoryGirl.create(:checklist, owner: user, name: "Checklist 1", frequency: :daily)
			get :index, format: :json
			expect(response.body).to eq Checklist.all.to_json
		end
	end
end