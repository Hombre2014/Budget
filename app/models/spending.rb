class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, length: { in: 1..50 }, presence: true, allow_blank: false
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
end
