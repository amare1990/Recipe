class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show
    @recipefoods = RecipeFood.includes(:food).where(recipe_id: params[:id])
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @foods = current_user.foods.map { |food| [food.name, food.id] }
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to user_recipe_recipe_food_url(current_user, @recipe, @recipe_food),
                      notice: 'Recipe food was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to user_recipe_recipe_food_url(current_user, @recipe, @recipe_food),
                      notice: 'Recipe food was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html do
        redirect_to user_recipe_recipe_foods_path(current_user, @recipe),
                    notice: 'Recipe food was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
    # @recipe = Recipe.where(user_id: currrent_user.id)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
