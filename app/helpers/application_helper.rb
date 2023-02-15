module ApplicationHelper
  def recipe_index
    controller_name == 'recipes' && action_name == 'index'
  end

  def recipe_show
    controller_name == 'recipes' && action_name == 'show'
  end

  def recipe_food_show
    controller_name == 'recipe_foods' && action_name == 'show'
  end
end
