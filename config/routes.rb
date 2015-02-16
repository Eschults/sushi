Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root to: "pages#home"

  get "tarifs", to: "pages#tarifs"

  resources :orders, only: [:new, :create, :index, :show]

  resources :users, only: [:edit, :update]

end
