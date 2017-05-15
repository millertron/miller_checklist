require 'rails_helper'

describe User do
	
	let (:user) { FactoryGirl.build(:user) }
	subject{user}

	context "validation" do
		it {should validate_presence_of(:username)}
		it {should validate_uniqueness_of(:username).case_insensitive}
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email).case_insensitive}		
	end
	
	context "#initialize" do
		it "sets status to PREACTIVE" do
			expect(user.preactive_status?).to be true
		end
	end
	
	context "being created" do
		it "generates an API key" do
			expect(user.api_key).to eq nil
			user.save
			expect(user.api_key).not_to eq nil
		end
		it "generates an activation code" do
			expect(user.activation_code).to eq nil
			user.save
			expect(user.activation_code).not_to eq nil
		end
	end
	
	context "being saved" do
		it "gets their username downcased" do
			user.username = "UPPERCASE"
			expect{ user.save }.to change{user.username}.from("UPPERCASE").to("uppercase")
		end
	end

end