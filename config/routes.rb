Rails.application.routes.draw do
root "welcome#index"
resources :likes, only: [:create, :destroy]
resources :statuses, only: [:new, :create, :update, :destroy, :edit]
resources :users, only: [:new, :create, :update, :destroy, :edit]
resources :sessions,only: [:new, :create]
delete'/signout', to: "sessions#destroy", as: "signout"

  
end
