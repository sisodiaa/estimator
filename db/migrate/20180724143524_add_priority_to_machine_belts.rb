class AddPriorityToMachineBelts < ActiveRecord::Migration[5.2]
  def change
    add_column :machine_belts, :priority, :integer, default: 1
  end
end
