class AddUserIdToBaby < ActiveRecord::Migration[5.2]
  def change
    add_reference :babies, :user, foreign_key: true
  end
end
