Rails.application.routes.draw do
  root "worries#index"
  resources :worries, only: [:index, :new, :create, :show, :destroy]
  resources :todos
  devise_for :users
end
