class CreateFormOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :form_options do |t|

	t.string :text_value
	t.string :context
	t.integer :seq
	
      t.timestamps
    end
  end
end
