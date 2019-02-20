class AddCoordinatesToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :latitude, :float
    add_column :babies, :longitude, :float
  end
end
