# == Route Map
#

Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  resources :users, only: %i[new create]
  resources :recipes do
    resources :recipe_ingredients
    resources :recipe_details
  end
  get 'ingredients/search', to: 'ingredients#search'
  resources :ingredients
end
