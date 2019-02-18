class RenameAdressToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :babies, :adress, :address
  end
end
