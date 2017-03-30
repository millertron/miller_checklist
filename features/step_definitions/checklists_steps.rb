
Given(/^there is a checklist that belongs to me$/) do
	#@my_checklist = FactoryGirl.create()
end

Then(/^I must see the checklist's summary$/) do
	#expect(page).to have_content()
end

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

#Given(/^$/) do
#
#end