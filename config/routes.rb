Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get 'twitter', to: 'twitter#index'
  post 'twitter/start', to: 'twitter#start'
  post 'twitter/stop', to: 'twitter#stop'
end
