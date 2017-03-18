FactoryGirl.define do

	factory :checklist_item do
		value_type :binary
		mandatory :true
	end

	factory :checklist do
		name "My Checklist"
		description "Description for my checklist"
		frequency :daily
	end
end