class AddPotentialToMills < ActiveRecord::Migration[5.2]
  def change
    add_column :mills, :potential, :decimal, default: 0.0
  end
end
