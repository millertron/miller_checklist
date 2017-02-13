class AddMandatoryToChecklistItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :checklist_items, :implementor, references: :users, index:true
	add_foreign_key :checklist_items, :users, column: :implementor_id
	
	Implementation.all.each do |i|
		if i.checklist
			i.update_attribute(:implementor, i.checklist.owner)
		end
	end
  end
end
