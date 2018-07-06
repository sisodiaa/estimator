class CreateMachineBelts < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_belts do |t|
      t.references :machine, foreign_key: true
      t.references :belt, foreign_key: true
      t.integer :length
      t.integer :width
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
