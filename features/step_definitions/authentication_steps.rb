
Given(/^I am logged in as (.*) with password (.*)$/) do |username, pass|
	ensure_logout
	
	if User.find_by_username(username) == nil
		FactoryGirl.create(:user, username: username, password: pass, status: :active)
	end

	do_login username, pass
end

Given(/^I am logged in as an admin user$/) do
	ensure_logout
	admin_user = FactoryGirl.create(:user, :status => :active, :admin => true)
	do_login admin_user.username, admin_user.password
end

Given(/^I am logged in as a basic user$/) do
	step 'I am logged in as kohachoji with password password123'
end

When(/^I log in as (.*) with password (.*)$/) do |username, pass|
	visit login_path
	fill_in "Username", :with => username
	fill_in "Password", :with => pass
	click_button "Login"	
end

def ensure_logout
	@current_logged_in_user = nil
	visit logout_path
end

def do_login username, pass
	visit login_path
	fill_in "Username", :with => username
	fill_in "Password", :with => pass
	click_button "Login"
	@current_logged_in_user = User.find_by_username(username)
end