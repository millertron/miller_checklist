require 'rails_helper'

describe Checklist do
	let(:checklist) { FactoryGirl.create(:checklist) }
	
	describe "validation" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:frequency)}
		it {should belong_to(:owner)}
		it {should validate_uniqueness_of(:name).scoped_to(:owner_id)}
	end
	
	describe "#checklist_item" do
		it "should return nil if checklist has no checklist items" do
			expect(checklist.checklist_item).to eq nil
		end
		
		it "should return the first checklist item from its collection of checklist items" do
			checklist_item = FactoryGirl.create(:checklist_item, checklist: checklist)
			checklist.update_attribute(:checklist_items, checklist.checklist_items << checklist_item)
			expect(checklist.checklist_item).to eq checklist_item
		end
		
	end
	
	describe "#update_last_implemented_date" do
		context "for an unimplemented checklist" do
			it "should set the last implemented date as nil" do
				checklist.update_last_implemented_date
				expect(checklist.last_implemented_date).to eq nil
			end
		end
		
		context "for a checklist that has been implemented previously" do
			it "should update the last implemented date correctly" do
				old_implementation = Implementation.new
				old_implementation.checklist = checklist
				old_implementation.implemented_date = DateTime.now - 2.days
				old_implementation.save
				
				latest_implementation = Implementation.new
				latest_implementation.checklist = checklist
				latest_implementation.implemented_date = DateTime.now - 1.days
				latest_implementation.save
				
				other_checklist = FactoryGirl.create(:checklist)
				
				latest_irrelevant_implementation = Implementation.new
				latest_irrelevant_implementation.checklist = other_checklist
				latest_irrelevant_implementation.implemented_date = DateTime.now				
				latest_irrelevant_implementation.save
				
				checklist.update_last_implemented_date
				
				expect(checklist.last_implemented_date).to eq latest_implementation.implemented_date
			end
		end
	end
	
end