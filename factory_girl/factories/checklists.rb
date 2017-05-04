FactoryGirl.define do

	factory :checklist_item do
		value_type :binary
		mandatory :true
	end

	factory :checklist do
		sequence(:name) { |n| "Factory Checklist #{n}" }
		description "Description for my checklist"
		frequency :daily
		association :owner, factory: :user 
	end
end