class AddMandatoryToChecklistItems < ActiveRecord::Migration[5.0]
  def change
    add_column :checklist_items, :mandatory, :boolean
  end
end
