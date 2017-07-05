class Implementation < ApplicationRecord
	after_save :notify_checklist
	
	belongs_to :checklist
	belongs_to :implementor, class_name: "User", required: false
	has_many :implementation_items, inverse_of: :implementation
	accepts_nested_attributes_for :implementation_items
	
	def notify_checklist
		self.checklist.update_attribute :last_implemented_date, self.implemented_date if self.checklist
	end
	
end
