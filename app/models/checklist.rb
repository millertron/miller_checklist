class Checklist < ApplicationRecord
	belongs_to :owner, class_name: "User", required: false
end
