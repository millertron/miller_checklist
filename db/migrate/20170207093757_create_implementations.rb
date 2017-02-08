class CreateImplementations < ActiveRecord::Migration[5.0]
  def change
    create_table :implementations do |t|
		t.belongs_to :checklist
		t.datetime :implemented_date
		
      t.timestamps
    end
  end
end
