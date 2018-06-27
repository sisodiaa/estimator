class CreateMillMachineBelts < ActiveRecord::Migration[5.2]
  def change
    create_table :mill_machine_belts do |t|
      t.references :mill_machine, foreign_key: true
      t.references :belt, foreign_key: true

      t.timestamps
    end

    add_index :mill_machine_belts, [:mill_machine_id, :belt_id], unique: true
  end
end
