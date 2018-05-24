Rails.application.routes.draw do
  root to: "products#index"

  get '/contact' => 'pages#contact' 
  get '/about_company' => 'pages#about_company' 

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount PointlessFeedback::Engine, :at => '/feedback'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, :products
  resources :carts, only: [:create, :show, :destroy]
  resources :line_items, only: [:create]
  resources :orders
  resources :categories
  resources :articles, only: [:index, :new, :create]
end
