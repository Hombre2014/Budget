class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # has_many :categories, through: :category_spending
end
