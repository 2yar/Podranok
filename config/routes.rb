Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations:'users/regestrations',
  }
  resources :users, :products
end
