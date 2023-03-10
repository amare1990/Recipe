class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { only_float: true, greater_than: 0 }
end
