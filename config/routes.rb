Rails.application.routes.draw do
  root "welcome#index"
  resources :worries, only: [:index, :new, :create, :show, :destroy]
  resources :todos
  resources :declarations, only: [:index, :new, :create, :destroy]
  resources :welcome, only: [:index]
  devise_for :users
  resources :users, only: :show
end