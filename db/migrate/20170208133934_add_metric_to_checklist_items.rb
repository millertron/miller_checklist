class AddMetricToChecklistItems < ActiveRecord::Migration[5.0]
  def change
    add_column :checklist_items, :metric_target_max, :string
    add_column :checklist_items, :metric_target_min, :string
  end
end
