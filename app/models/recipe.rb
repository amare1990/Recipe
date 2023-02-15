class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :public, inclusion: { in: [true, false], message: 'Please, select one!' }
end
