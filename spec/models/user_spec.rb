require 'spec_helper'

describe User do
	
	let(:valid_attributes) {
		{
			first_name: "Koha",
			last_name: "Choji",
			username: "kohachoji",
			password: "pass",
			password_confirmation: "pass",
		}
	}
	
	context "validation" do
		let (:user) { FactoryGirl.build(:user, valid_attributes) }
		it "requires a username" do
			expect(user).to validate_presence_of(:username)
		end
		
		it "requires a unique username" do
			expect(user).to validate_uniqueness_of(:username)
		end
		
		it "requires a unique username (case insensitive)" do
			user.username = "kohachoji"
			expect(user).to validate_uniqueness_of(:username)
		end
		
	end
	
	context "being saved" do
		let (:user) { FactoryGirl.build(:user, valid_attributes.merge(username: "UPPERCASE")) }
		
		it "gets their username downcased" do
			expect(user.save).to eq true
			expect(user.username).to eq("uppercase")
		end
	end

end