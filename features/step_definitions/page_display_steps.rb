Then(/^I must see a (.*) flash that says "([^"]*)"$/) do |flash_type, flash_message|
	#This is case-sensitive. It would be nicer if it weren't.
	expect(page).to have_css(".alert.alert-#{flash_type}", text: flash_message)	
end