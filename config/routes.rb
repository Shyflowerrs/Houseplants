Rails.application.routes.draw do
  resources :contacts
  resources :abouts
  resources :products
  devise_for :users
  # get "home/index"
  # get "home/show"
  # get "product/index"
  # get "product/create"
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  root "home#index"
  get "about", to: "about#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "product/search", to: "product#search"
  resources :products, only: %i[index show] do
    #   collection do
    #     get "search"
    #   end
  end
end
