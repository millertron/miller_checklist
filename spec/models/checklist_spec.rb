require 'spec_helper'

describe Checklist do
	
	context "validation" do
		let (:checklist) { FactoryGirl.build(:checklist) }
		it "requires a name" do
			expect(checklist).to validate_presence_of(:name)
		end
		
		it "requires a frequency" do
			expect(checklist).to validate_presence_of(:frequency)
		end
		
		it "requires a unique name (case insensitive)" do
			checklist.name = "kohachoji"
			expect(checklist).to validate_uniqueness_of(:name)
		end
		
	end
end