Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations", sessions: "sessions", passwords: "passwords" }
  ActiveAdmin.routes(self)

  root to: "pages#home"

  get "tarifs", to: "pages#tarifs"
  get "faq", to: "pages#faq"
  get "cgu", to: "pages#cgu"
  get "service", to: "pages#service"
  get "/sitemap", to:"pages#sitemap"

  resources :orders, only: [:new, :create, :index, :show]

  resources :users, only: [:edit, :update]

  resources :stripe_customers

  resources :stripe_payments

end
