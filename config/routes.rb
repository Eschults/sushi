Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: "pages#home"

  get "tarifs", to: "pages#tarifs"
  get "about", to: "pages#about"

  resources :orders, only: [:new, :create, :index, :show]

  resources :users, only: [:edit, :update]

  resources :stripe_customers

end
