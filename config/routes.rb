Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create]
  delete 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :movies
end
