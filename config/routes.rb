Rails.application.routes.draw do
  root to: "products#index"

  get '/contact' => 'pages#contact' 
  get '/about_company' => 'pages#about_company' 
  get '/info' => 'pages#info' 

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :users, :products
  resources :carts, only: [:create, :show, :destroy]
  resources :line_items, only: [:create]
  resources :orders
  resources :categories
end
