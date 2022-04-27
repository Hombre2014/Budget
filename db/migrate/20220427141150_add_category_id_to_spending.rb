class AddCategoryIdToSpending < ActiveRecord::Migration[7.0]
  def change
      add_column :spendings, :category_id, :integer
  end
end
