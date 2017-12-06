Rails.application.routes.draw do
  resources :orders
  root to: "products#index"

  devise_for :users
  resources :users, :products
end
