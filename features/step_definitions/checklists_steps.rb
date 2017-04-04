
Given(/^there is an incomplete, (.*) checklist that belongs to me called (.*)$/) do |frequency, checklist_name|
	if Checklist.where(owner_id: @current_logged_in_user, frequency: frequency, name: checklist_name).count == 0
		@checklist = FactoryGirl.create(:checklist, owner: @current_logged_in_user, name: checklist_name, frequency: frequency)
		@checklist.checklist_items.push FactoryGirl.create(:checklist_item, checklist: @checklist)
		@checklist.save
	else
		return false
	end
end

Then(/^I must see the implementation link for (.*) under (.*) checklists$/) do |checklist_name, frequency|
	case frequency 
	when "daily" 
		@checklist_section_heading = "Checklists to complete today" 
	when "weekly" 
		@checklist_section_heading = "Checklists to complete this week" 
	when "monthly" 
		@checklist_section_heading = "Checklists to complete this month" 
	else 
		@checklist_section_heading = "false content"
	end
	expect(page).to have_content @checklist_section_heading
	@section_div = "div.#{frequency}-checklists"
	within(@section_div) do
		expect(page).to have_content checklist_name
	end
end

Then(/^I must see a link to the checklist creation page$/) do
	expect(page).to have_content "Create Checklist"
end

When(/^I go to the checklist creation page$/) do
	click_on "Create Checklist"	
end

Then(/^I must see a checklist creation form$/) do
	expect(page).to have_content "New Checklist for"
	expect(page).to have_selector "input[type='submit'][value='Create Checklist']"
	#expect(page).to have_content "Create Checklist" #Doesn't work - is it because it's a submit button???
end

Given(/^there is an incomplete, (.*) checklist that belongs to someone else$/) do |frequency|
	if User.find_by_username("someoneelse") == nil
		FactoryGirl.create(:user, username: "someoneelse", password: "password123", password_confirmation: "password123")
	end
	
	@checklist = FactoryGirl.create(:checklist, owner: User.find_by_username("someoneelse"), name: "someone else's checklist", frequency: frequency)
	@checklist.checklist_items.push FactoryGirl.create(:checklist_item, checklist: @checklist)
	@checklist.save	
end

Then(/^I must not see the implementation link for checklists that is not mine$/) do
	@foreign_checklists = Checklist.where.not(owner: @current_logged_in_user)
	@foreign_checklists.each do |checklist|
		expect(page).to have_no_content(checklist.name)
	end
end 

#Given(/^$/) do
#
#end