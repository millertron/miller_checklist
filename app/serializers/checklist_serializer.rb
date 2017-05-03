class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner_id, :frequency, :description
  
  has_many :checklist_items
end
