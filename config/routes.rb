Rails.application.routes.draw do
  root "worries#index"
  resources :worries, only: :index
  devise_for :users
end
