Rails.application.routes.draw do
  get 'home/top'
  get 'companyrooms/show'
  get 'companies/show'
  devise_for :companies
  devise_for :users

  resources :users, only: [:index, :show]
  resources :companies, only: [:index, :show]
  resources :posts
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :company_posts
  resources :companyrequired_posts
  resources :companyrooms, only: [:show, :create] do
    resources :companymessages, only: [:create]
  end
  root 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
