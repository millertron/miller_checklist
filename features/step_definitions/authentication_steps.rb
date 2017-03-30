
Given(/^I am logged in as (.*) with password (.*)$/) do |username, pass|

	@current_logged_in_user = nil
	visit logout_path
	
	if User.find_by_username(username) == nil
		FactoryGirl.create(:user, username: username, password: pass, password_confirmation: pass)
	end

	visit root_path
	fill_in "Username", :with => username
	fill_in "Password", :with => pass
	click_button "Login"
	
	@current_logged_in_user = User.find_by_username(username)
end

Given(/^I am logged in as admin$/) do
	step 'I am logged in as kohachoji with password password123'
end

Given(/^I am logged in as a basic user$/) do
	step 'I am logged in as kohachoji with password password123'
end
