class AddMoreColumnsToBelt < ActiveRecord::Migration[5.2]
  def change
    add_column :belts, :rate, :decimal, precision: 8, scale: 2
    add_column :belts, :minor_join_charge, :integer
    add_column :belts, :major_join_charge, :integer
    add_column :belts, :rounding_off, :integer
  end
end
