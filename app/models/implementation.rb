class Implementation < ApplicationRecord
	belongs_to :checklist
	has_many :implementation_items, inverse_of: :implementation
	accepts_nested_attributes_for :implementation_items
	
end
