class ChecklistItem < ApplicationRecord
	#currently checklist only supports one item, but enable one-to-many relationship
	belongs_to :checklist
	
end
