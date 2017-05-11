
When(/^I go to the dashboard page$/) do
	visit(root_path)
end

When(/^I go to the checklist creation page$/) do
	click_on "Create Checklist"	
end

When(/^I go to the login page$/) do
	visit login_path
end

When(/^I go to the sign up page$/) do
	visit login_path
	click_on "Sign up!"
end

Then(/^I should end up at the dashboard$/) do
	expect(page).to have_current_path(root_path, only_path: true)
end

Then(/^I must end up at the login page$/) do
	expect(page).to have_current_path(login_path, only_path: true)
end
