
Given(/^there is a checklist that belongs to me$/) do
	#@my_checklist = FactoryGirl.create()
end

When(/^I go to the dashboard page$/) do
	visit(root_path)
end

Then(/^I must see the checklist's summary$/) do
	#expect(page).to have_content()
end

#Given(/^$/) do
#
#end