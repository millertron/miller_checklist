require 'spec_helper'

describe Checklist do
	let(:checklist) { FactoryGirl.create(:checklist) }
	
	context "validation" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:frequency)}
		it {should belong_to(:owner)}
		it {should validate_uniqueness_of(:name).scoped_to(:owner_id)}
	end
	
	context "#checklist_item" do
		it "should return nil if checklist has no checklist items" do
			expect(checklist.checklist_item).to eq nil
		end
		
		it "should return the first checklist item from its collection of checklist items" do
			checklist_item = FactoryGirl.create(:checklist_item, checklist: checklist)
			checklist.update_attribute(:checklist_items, checklist.checklist_items << checklist_item)
			expect(checklist.checklist_item).to eq checklist_item
		end
		
	end
	
end