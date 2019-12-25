Rails.application.routes.draw do
  root "items#index"

  resource :session, only: [:create, :destroy]

  resources :users do
    resources :items do
      resources :comments
      resources :requests
    end
    resources :boughts
    resources :favorites
  end

  resources :items
  resources :comments
  resources :requests
  resources :boughts
  resources :favorites
  resources :login, only: [:index]
end
