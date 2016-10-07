Rails.application.routes.draw do
  get '/users', to: redirect('/')
  resource :users, only: [:new, :create, :update]
  resource :sessions, only: [:new, :create, :destroy]
  resources :groups

  get 'home/index'
  root 'home#index'
end
