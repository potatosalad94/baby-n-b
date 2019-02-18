class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string :name
      t.text :description
      t.integer :age
      t.string :adress
      t.string :city
      t.integer :price

      t.timestamps
    end
  end
end
