class AddPriceToMachineBelts < ActiveRecord::Migration[5.2]
  def change
    add_column :machine_belts, :price, :decimal, default: 0.0
  end
end
