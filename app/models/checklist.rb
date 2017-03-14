class Checklist < ApplicationRecord
	
	validates :name, presence: true
	validates :frequency, presence: true
	
	attr_accessor :implemented

	belongs_to :owner, class_name: "User", required: false
	has_many :checklist_items, inverse_of: :checklist
	
	accepts_nested_attributes_for :checklist_items
	
	def is_implemented?
		if implemented
			return true
		else
			return false
		end
	end
end
