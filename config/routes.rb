Rails.application.routes.draw do
  root "worries#index"
  resources :worries, only: [:index, :new, :create, :show, :destroy]
  resources :todos
  resources :declarations, only: [:index, :new, :create]
  devise_for :users
end