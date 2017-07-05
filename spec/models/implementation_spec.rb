require 'rails_helper'

RSpec.describe Implementation, type: :model do
	let(:checklist){FactoryGirl.create(:checklist)}
	let(:implementation){FactoryGirl.build(:implementation, {:checklist => checklist})}
	
	describe "#notify_checklist" do
		it "should be updating the checklist\'s last implemented date" do
			implementation.implemented_date = DateTime.now - 10.days
			expect(checklist.last_implemented_date).to eq nil
			
			implementation.notify_checklist
			expect(checklist.last_implemented_date).to eq implementation.implemented_date
		end
		
		it "should be called upon saving the implementation" do
			expect(implementation).to receive(:notify_checklist)
			implementation.save
			expect(checklist.last_implemented_date).to eq implementation.implemented_date			
		end
	end
end
