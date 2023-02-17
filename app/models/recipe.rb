class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_float: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_float: true, greater_than: 0 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :public, inclusion: { in: [true, false], message: 'Please, select one!' }

  def total_price
    recipe_foods = RecipeFood.includes(:food).where(recipe_id: id)
    total_price = 0
    recipe_foods.each do |recipe_food|
      unit_price = recipe_food.food.price * recipe_food.quantity
      total_price += unit_price
    end

    total_price
  end

  def total_food_items
    recipe_foods = RecipeFood.where(recipe_id: id)
    recipe_foods.length
  end
end
