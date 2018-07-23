class AddPotentialToMillMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :mill_machines, :potential, :decimal, default: 0.0
  end
end
