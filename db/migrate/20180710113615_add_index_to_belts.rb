class AddIndexToBelts < ActiveRecord::Migration[5.2]
  def change
    add_index :belts, :grade, unique: true
  end
end
