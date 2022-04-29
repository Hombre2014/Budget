class Category < ApplicationRecord
  belongs_to :user
  has_many :spendings

  validates :name, length: { in: 1..50 }, presence: true, allow_blank: false
  validates :icon, presence: true, allow_blank: false
end
