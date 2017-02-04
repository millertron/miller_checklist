class Checklist < ApplicationRecord
	belongs_to :owner, class_name: "User", required: false
	has_many :checklist_items
end
