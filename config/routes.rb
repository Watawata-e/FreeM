Rails.application.routes.draw do
  root "items#index"

  resource :session, only: [:create, :destroy]

  resources :users do
    resources :items
    resources :boughts
    resources :favorites
    resources :requests
  end

  resources :items
  resources :comments
  resources :requests
  resources :boughts
  resources :favorites
  resources :login, only: [:index]
end
