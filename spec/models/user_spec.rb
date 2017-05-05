require 'spec_helper'

describe User do
	
	let (:user) { FactoryGirl.build(:user) }
	subject{user}

	context "validation" do
		it {should validate_presence_of(:username)}
		it {should validate_uniqueness_of(:username).case_insensitive}
		end
	context "being created" do
		it "generates an API key" do
			expect(user.api_key).to eq nil
			user.save
			expect(user.api_key).not_to eq nil
		end
		end
	end
	
	context "being saved" do
		it "gets their username downcased" do
			user.username = "UPPERCASE"
			expect{ user.save }.to change{user.username}.from("UPPERCASE").to("uppercase")
		end
	end

end