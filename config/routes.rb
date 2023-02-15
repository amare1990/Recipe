Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    
  root 'recipes#public_recipes'
end
