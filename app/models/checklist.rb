class Checklist < ApplicationRecord
	
	validates :name, presence: true, uniqueness: {:scope => :owner_id, :case_sensitive => false}
	validates :frequency, presence: true
	
	attr_accessor :implemented

	belongs_to :owner, class_name: "User"
	has_many :checklist_items, inverse_of: :checklist
	
	accepts_nested_attributes_for :checklist_items
	
	def implemented?
		@implemented || false
	end
	
	def checklist_item
		checklist_items.first if checklist_items
	end

	def update_last_implemented_date
		last_implementation = Implementation.where(:checklist => self).last
		self.update_attribute :last_implemented_date, last_implementation.implemented_date if last_implementation
	end
	
end
