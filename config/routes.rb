Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'home/index'

  root 'home#index'
end
