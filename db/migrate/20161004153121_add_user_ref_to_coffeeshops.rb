class AddUserRefToCoffeeshops < ActiveRecord::Migration[5.0]
  def change
    add_reference :coffeeshops, :user, foreign_key: true
  end
end
