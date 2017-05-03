require 'spec_helper'

describe User do
	
	context "validation" do
		let (:user) { FactoryGirl.build(:user) }
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
		let! (:user) { FactoryGirl.build(:user, username: "UPPERCASE") }
		
		it "gets their username downcased" do
			expect{ user.save }.to change{user.username}.from("UPPERCASE").to("uppercase")
		end
		
		it "generates an API key" do
			expect(user.api_key).to eq nil
			user.save
			expect(user.api_key).not_to eq nil
		end
	end

end