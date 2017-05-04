require 'spec_helper'

describe Checklist do
	context "validation" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:frequency)}
		it {should belong_to(:owner)}
		it {should validate_uniqueness_of(:name).scoped_to(:owner_id)}
	end
	
end