Rails.application.routes.draw do
  devise_for :users
  # get "home/index"
  # get "home/show"
  # get "product/index"
  # get "product/create"
  root "home#index"
  get "about", to: "about#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
