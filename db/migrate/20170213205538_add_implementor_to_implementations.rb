class AddImplementorToImplementations < ActiveRecord::Migration[5.0]
  def change
	add_reference :implementations, :implementor, references: :users, index:true
	add_foreign_key :implementations, :users, column: :implementor_id
	
	Implementation.all.each do |i|
		if i.checklist
			i.update_attribute(:implementor, i.checklist.owner)
		end
	end
  end
end
