Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :purchases do
    resources :shipping_addresses, only: :create
  end
end
