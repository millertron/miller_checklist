class FormOption < ApplicationRecord
	validates :text_value, presence: true, uniqueness: {:scope => :context, :case_sensitive => false}
	validates :context, presence: true, uniqueness: {:case_sensitive => false}
end
