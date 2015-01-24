require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  root to: 'twitter#index'
  devise_for :users
  resources :users
  get 'twitter', to: 'twitter#index'
  get 'twitter/start', to: 'twitter#start'
  get 'twitter/stop', to: 'twitter#stop'
end
