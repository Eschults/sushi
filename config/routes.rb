Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations", session: "sessions" }
  ActiveAdmin.routes(self)

  root to: "pages#home"

  get "tarifs", to: "pages#tarifs"
  get "about", to: "pages#about"

  resources :orders, only: [:new, :create, :index, :show]

  resources :users, only: [:edit, :update]

  resources :stripe_customers

  resources :stripe_payments

end
