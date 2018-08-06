class RemoveMillMachineUniquenessIndexFromMillMachines < ActiveRecord::Migration[5.2]
  def change
    remove_index :mill_machines, name: "index_mill_machines_on_mill_id_and_machine_id"
  end
end
