# == Route Map
#

Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  get 'how_to_use', to: 'static_pages#how_to_use', as: :how_to_use
  get 'faq', to: 'static_pages#faq', as: :faq
  get 'term_of_service', to: 'static_pages#term_of_service', as: :term_of_service
  get 'privacy_policy', to: 'static_pages#privacy_policy', as: :privacy_policy
  get 'support', to: 'static_pages#support', as: :support
  get 'contact', to: 'static_pages#contact', as: :contact
  resources :users, only: %i[new create]
  resources :recipes do
    resources :recipe_ingredients
    resources :recipe_details
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  get 'ingredients/search', to: 'ingredients#search'
  resources :ingredients
  resources :bookmarks, only: %i[create destroy]
end
