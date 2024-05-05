# == Route Map
#

Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  resources :users, only: %i[new create]
end
