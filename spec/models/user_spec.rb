require 'spec_helper'

describe User do
	
	context "without password" do
		before do
			@user = FactoryGirl.build(:user)
		end
		
		it "is invalid user'" do
			expect(@user.first_name).to eq("Koha")
			expect(@user).to be_invalid
		end
	end
	
	context "with all required details" do
		before do
			@user = FactoryGirl.build(:user, password: "pass", password_confirmation: "pass", username: "koha")
		end
		
		it "is valid user" do
			expect(@user).to be_valid
		end
	end
	
	context "with the same username as another user" do
		before do
			@user_a = FactoryGirl.create(:user, password: "pass1", password_confirmation: "pass1", username: "koha")
			@user_b = FactoryGirl.build(:user, password: "pass2", password_confirmation: "pass2", username: "koha")
		end
		
		it "is invalid user" do
			expect(@user_b).to be_invalid
		end
		
		after do
			DatabaseCleaner.clean
		end
	end
end