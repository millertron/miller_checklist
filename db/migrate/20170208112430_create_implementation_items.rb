class CreateImplementationItems < ActiveRecord::Migration[5.0]
  def change
    create_table :implementation_items do |t|
		t.belongs_to :implementation
		t.string :text
		t.boolean :binary_value
      t.timestamps
    end
  end
end
