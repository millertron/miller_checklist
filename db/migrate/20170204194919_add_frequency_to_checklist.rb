class AddFrequencyToChecklist < ActiveRecord::Migration[5.0]
  def change
    add_column :checklists, :frequency, :string
  end
end
