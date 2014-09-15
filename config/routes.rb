Rails.application.routes.draw do
  
  devise_for :views
  devise_for :users

  resources :users, only: [:index, :show, :new] do
    resources :messages
  end

  resources :friendships, only: [:create, :destroy]
  
  root to: "users#index"
end
