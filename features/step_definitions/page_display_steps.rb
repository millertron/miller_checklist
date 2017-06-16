Then(/^I must see a (.*) flash that says "([^"]*)"$/) do |flash_type, flash_message|
	#This is case-sensitive. It would be nicer if it weren't.
	expect(page).to have_css("div.alert-#{flash_type}")
	within(:css, "div.alert-#{flash_type}") do
		expect(page).to have_content(flash_message)
	end
end