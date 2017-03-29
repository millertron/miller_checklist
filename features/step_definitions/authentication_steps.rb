
Given(/^I am logged in as (.*) with password (.*)$/) do |username, pass|

	visit logout_path
	
	if User.find_by_username(username) == nil
		FactoryGirl.create(:user, username: username, password: pass, password_confirmation: pass)
	end

	visit root_path
	fill_in "Username", :with => username
	fill_in "Password", :with => pass
	click_button "Login"
end

Given(/^I am logged in as admin$/) do
	step 'I am logged in as kohachoji with password password123'
end