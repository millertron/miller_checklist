require 'spec_helper'

describe ChecklistsController do

	context "building from factory" do
		
		before do
			@checklist = FactoryGirl.build(:checklist)
			@checklist_item = FactoryGirl.build(:checklist_item, checklist: @checklist)
			@checklist.checklist_items.push(@checklist_item)
		end
		
		it "builds a checklist" do
			expect(@checklist.checklist_items.size).to eq(1) 
		end
		
	end

end