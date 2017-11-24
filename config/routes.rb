Rails.application.routes.draw do
  get 'users/index'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/show'

  get 'users/destroy'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
