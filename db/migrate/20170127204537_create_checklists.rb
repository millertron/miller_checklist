class CreateChecklists < ActiveRecord::Migration[5.0]
	def change
		create_table :checklists do |t|
			t.string :name
			t.string :description
			t.belongs_to :owner, class_name: "User"
			t.timestamps
		end
	end
end
