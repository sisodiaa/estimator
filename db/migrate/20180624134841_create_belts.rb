class CreateBelts < ActiveRecord::Migration[5.2]
  def change
    create_table :belts do |t|
      t.string :grade

      t.timestamps
    end
  end
end
