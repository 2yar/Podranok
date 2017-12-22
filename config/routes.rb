Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users
  resources :users, :products
  resources :carts, only: [:create, :show, :destroy]
  resources :line_items, only: [:create]
  resources :orders
end
