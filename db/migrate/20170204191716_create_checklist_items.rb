class CreateChecklistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :checklist_items do |t|
		t.belongs_to :checklist
		t.string :text
		t.string :value_type
      t.timestamps
    end
  end
end
