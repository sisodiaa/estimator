class CreateMillMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :mill_machines do |t|
      t.references :mill, foreign_key: true
      t.references :machine, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end

    add_index :mill_machines, [:mill_id, :machine_id], unique: true
  end
end
