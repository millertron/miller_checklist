FactoryGirl.define do
	factory :user do
		first_name "Factory"
		sequence(:last_name) {|n| "User#{n}"} 
		sequence(:username) {|n| "factory_user#{n}"} 
		sequence(:email) {|n| "factory_user#{n}@test.com"} 
		password "password"
		password_confirmation "password"
		status :preactive
	end
end
