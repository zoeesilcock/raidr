Rails.application.routes.draw do
  get '/users', to: redirect('/')
  resource :users, only: [:new, :create, :update]
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'

  resource :sessions, only: [:new, :create, :destroy]

  resources :groups do
    get :join
    get :leave
  end

  resources :guardians, only: [:create, :destroy] do
    get :toggle
  end

  get 'home/index'
  root 'home#index'
end
