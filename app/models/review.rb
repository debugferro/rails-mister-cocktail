class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, presence: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :rating, presence: true, numericality:
    {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    }
end
