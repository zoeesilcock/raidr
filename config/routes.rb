Rails.application.routes.draw do
  resource :users, only: [:new, :create, :update]
  get 'home/index'

  root 'home#index'
end
