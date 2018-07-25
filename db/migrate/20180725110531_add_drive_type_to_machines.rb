class AddDriveTypeToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :drive_type, :string
  end
end
