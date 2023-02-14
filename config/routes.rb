Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :foods
    resources :recipes
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   root "foods#index"
  # end

  root 'recipes#public_recipes'
end
