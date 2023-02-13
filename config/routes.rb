Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :foods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"
end
