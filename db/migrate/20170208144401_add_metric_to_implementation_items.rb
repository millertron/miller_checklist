class AddMetricToImplementationItems < ActiveRecord::Migration[5.0]
  def change
    add_column :implementation_items, :metric_value, :string
    add_column :implementation_items, :metric_target_max, :string
    add_column :implementation_items, :metric_target_min, :string
  end
end
