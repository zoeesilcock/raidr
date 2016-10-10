Rails.application.routes.draw do
  get '/users', to: redirect('/')
  resource :users, only: [:new, :create, :update]
  resource :sessions, only: [:new, :create, :destroy]
  resources :groups do
    get :join
    get :leave
  end

  get 'home/index'
  root 'home#index'
end
