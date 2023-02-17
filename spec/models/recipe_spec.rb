require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create!(name: 'Amaremek', email: 'am@test.com', password: '1234567')
    @recipe1 = Recipe.create!(name: 'QiQil recipe', preparation_time: 2.53, cooking_time: 3.05,
                              description: 'meat, kimem, salt, peppers, enjera', user_id: @user.id, public: true)
    @food1 = Food.create!(name: 'Beyaynet', measurement_unit: 'unit', price: 100.5, quantity: 2,
                          user_id: @user.id)
    @recipe_food1 = RecipeFood.create!(quantity: 2, food_id: @food1.id, recipe_id: @recipe1.id)
  end

  # before { subject.save }

  describe " model presence validations : \n" do
    it "\nname attribute value should be present" do
      @recipe1.name = nil
      expect(@recipe1).to_not be_valid
    end

    it "\nname attribute value should be exactly 'QiQil' " do
      expect(@recipe1.name).to eq('QiQil recipe')
    end

    it "\nPreparation_time attribute value should be present" do
      @recipe1.preparation_time = nil
      expect(@recipe1).to_not be_valid
    end

    it "\ncooking_time attribute value should be present" do
      @recipe1.cooking_time = nil
      expect(@recipe1).to_not be_valid
    end

    it "\ndescription attribute value should be present" do
      @recipe1.description = nil
      expect(@recipe1).to_not be_valid
    end

    it "\n preparaion_time attribute should not be a string" do
      @recipe1.preparation_time = '2 hrs'
      expect(@recipe1).to_not be_valid
    end

    it "\n cooking_time attribute should not be a string" do
      @recipe1.cooking_time = '3 hrs time'
      expect(@recipe1).to_not be_valid
    end

    it "\n preparaion_time attribute should not be equal to zero" do
      @recipe1.preparation_time = 0
      expect(@recipe1).to_not be_valid
    end

    it "\n cooking_time attribute should not be equal to 0" do
      @recipe1.cooking_time = '3 hrs time'
      expect(@recipe1).to_not be_valid
    end

    it "\n preparaion_time attribute should not be -ve number" do
      @recipe1.preparation_time = -3
      expect(@recipe1).to_not be_valid
    end

    it "\n cooking_time attribute should not be -ve number" do
      @recipe1.cooking_time = -0.5
      expect(@recipe1).to_not be_valid
    end

    it "\n description attribute value should not be greater than 300" do
      @recipe1.description = 'A' * 301
      expect(@recipe1).to_not be_valid
    end
  end

  describe "\n Model total_price and total food item validations\n" do
    it "The total fodd items should be equal to 1 \n " do
      expect(@recipe1.total_food_items).to eq(1)
    end

    it "The total price should be equal to 402 \n " do
      expect(@recipe1.total_price).to eq(201)
    end
  end
end
