class AddCodeToMills < ActiveRecord::Migration[5.2]
  def change
    add_column :mills, :code, :string
    add_index :mills, :code, unique: true
  end
end
