class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner_id, :frequency, :description, :last_implemented_date
  
  has_many :checklist_items
end
