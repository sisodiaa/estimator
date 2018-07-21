class AddPotentialToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :potential, :decimal, default: 0.0
  end
end
