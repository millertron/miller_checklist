Given(/^I am a guest user$/) do
	@current_logged_in_user = nil
	visit logout_path
end

Then(/^I must see the link to the sign\-up page$/) do
	expect(page).to have_link "Sign up!", signup_path
end

Then(/^I must see a user creation form$/) do
	expect(page).to have_content "Sign-up form"
	expect(page).to have_selector "input[type='submit'][value='Sign up']"
end

Then(/^there should be form fields for (.*)$/) do |args|
	args.split(', ').each do |field|
		expect(page).to have_field field.capitalize
	end
end

When(/^I submit the form filled in with (.*)$/) do |args|
	args.split(', ').each do |arg|
		field_params = arg.split('=')
		field = field_params[0]
		value = field_params[1]
		fill_in field.capitalize, :with=>value 
	end
	click_on "Sign up"
end
