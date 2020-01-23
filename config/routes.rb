Rails.application.routes.draw do
  namespace :admin do
    root "top#index"
    resources :users
  end

  root "items#index"

  resource :session, only: [:create, :destroy]

  resources :users do
    resources :items
    resources :boughts
    resources :favorites
    resources :requests
  end

  resources :items do
    get "search", on: :collection
  end

  resources :comments
  resources :requests
  resources :boughts
  resources :favorites
  resources :login, only: [:index]
end
