class AddUserRefToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :spendings, :user, null: false, foreign_key: true
  end
end
