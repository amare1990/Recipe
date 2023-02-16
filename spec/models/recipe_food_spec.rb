require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create!(name: 'Amaremek', email: 'am@test.com', password: '1234567')
    @recipe1 = Recipe.create!(name: 'QiQil recipe', preparation_time: 2.53, cooking_time: 3.05,
                              description: 'meat, kimem, salt, peppers, enjera', user_id: @user.id, public: true)
    @food1 = Food.create!(name: 'Beyaynet', measurement_unit: 'unit', price: 100.5, quantity: 2,
                          user_id: @user.id)
    @recipe_food1 = RecipeFood.create!(quantity: 2, food_id: @food1.id, recipe_id: @recipe1.id)
  end

  # before { subject.save }

  describe " model validations : \n" do
    it "\n food to be present as a reference as food_id" do
      expect(@recipe_food1.food_id).to_not be_nil
    end

    it "\n recipe to be present as a reference as recipe_id" do
      expect(@recipe_food1.recipe_id).to_not be_nil
    end
  
    it 'quantity should be greater than 0' do
      @recipe_food1.quantity = 0
      expect(@recipe_food1).to_not be_valid
      @recipe_food1.quantity = 1
      expect(@recipe_food1).to be_valid
    end

    it "\n The quantity of food Beyaynet should be equal to 2 \n " do
      expect(@recipe_food1.quantity).to eq(2)
    end

  end
end
