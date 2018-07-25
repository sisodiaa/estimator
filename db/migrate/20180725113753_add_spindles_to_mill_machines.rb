class AddSpindlesToMillMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :mill_machines, :spindles, :integer, default: 0
  end
end
