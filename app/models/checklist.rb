class Checklist < ApplicationRecord
	belongs_to :owner, class_name: "User", required: false
	has_many :checklist_items, inverse_of: :checklist
	
	accepts_nested_attributes_for :checklist_items
end
