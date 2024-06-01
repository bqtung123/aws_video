require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users
  resources :posts
  root 'posts#index'
end
