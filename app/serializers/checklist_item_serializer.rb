class ChecklistItemSerializer < ActiveModel::Serializer
  attributes :id, :checklist_id, :text, :value_type, :metric_target_max, :metric_target_min, :mandatory
end
