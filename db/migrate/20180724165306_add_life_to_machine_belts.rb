class AddLifeToMachineBelts < ActiveRecord::Migration[5.2]
  def change
    add_column :machine_belts, :life, :integer, default: 12
  end
end
