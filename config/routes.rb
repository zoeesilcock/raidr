Rails.application.routes.draw do
  resource :users, only: [:new, :create, :update]

  get 'hello_world', to: 'hello_world#index'
  get 'home/index'

  root 'home#index'
end
