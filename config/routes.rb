Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :users
  resources :posts
end
