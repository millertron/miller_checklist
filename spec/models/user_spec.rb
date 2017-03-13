require 'spec_helper'

describe User do
	
	context "named user" do
		before do
			@user = build(:user)
		end
		
		it "is invalid user'" do
			expect(@user.first_name).to eq("Koha")
			expect(@user).to be_invalid
		end
		
	end
	
end