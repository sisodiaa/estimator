class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :make
      t.string :model
      t.string :section
      t.string :sub_section

      t.timestamps
    end
  end
end
