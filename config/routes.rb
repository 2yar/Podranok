Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "products#index"

  devise_for :users
  resources :users, :products
  resources :carts, only: [:create, :show, :destroy]
  resources :line_items, only: [:create]
  resources :orders
  resources :categories
end
