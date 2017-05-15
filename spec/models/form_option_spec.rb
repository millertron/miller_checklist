require 'rails_helper'

describe FormOption, type: :model do

	context "validation" do
		it {should validate_presence_of(:text_value)}
		it {should validate_presence_of(:context)}
		it {should validate_uniqueness_of(:context).case_insensitive}
		it {should validate_uniqueness_of(:text_value).scoped_to(:context)} #some reason can't test case insensitivity with scope
	end

end