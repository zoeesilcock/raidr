Rails.application.routes.draw do
  resource :users, only: [:new, :create, :update]
  resource :sessions, only: [:new, :create, :delete]

  get 'home/index'
  root 'home#index'
end
