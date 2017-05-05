FactoryGirl.define do
	factory :user do
		first_name "Factory"
		sequence(:last_name) {|n| "User#{n}"} 
		sequence(:username) {|n| "factory_user#{n}"} 
		password "password"
		password_confirmation "password"
	end
end
