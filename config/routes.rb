Rails.application.routes.draw do
  
  
  devise_for :users

  resources :users, only: [:index, :show, :new] do
    resources :messages, except: [:edit, :destroy]
  end

  resources :friendships, only: [:create, :destroy]
  
  root to: "users#index"
end
