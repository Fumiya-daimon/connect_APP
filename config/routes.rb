Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
