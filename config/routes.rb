Rails.application.routes.draw do
  root "items#index"

  resources :users do
    resources :items
  end

  resources :items
end
