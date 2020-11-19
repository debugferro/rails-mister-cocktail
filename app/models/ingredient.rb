class Ingredient < ApplicationRecord
  before_destroy :verify_cocktail_existence
  has_many :doses
  # belongs_to :cocktail, through: :doses
  validates :name, presence: true, uniqueness: true, allow_blank: false

  private

  def verify_cocktail_existence
    # byebug
    if self.doses.any?
      errors[:base] << 'Cannot delete an ingredient while beign part of a cocktail'
      false
    end
  end
end
