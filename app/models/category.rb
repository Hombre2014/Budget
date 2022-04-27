class Category < ApplicationRecord
  belongs_to :user
  # belongs_to :spending

  has_many :spendings
end
