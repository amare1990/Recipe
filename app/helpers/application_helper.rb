module ApplicationHelper
  def recipe_index
    controller_name == 'recipes' && action_name == 'index'
  end

  def recipe_show
    controller_name == 'recipes' && action_name == 'show'
  end
end
