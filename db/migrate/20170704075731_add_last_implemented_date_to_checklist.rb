class AddLastImplementedDateToChecklist < ActiveRecord::Migration[5.0]
  def change
    add_column :checklists, :last_implemented_date, :timestamp
  end
end
