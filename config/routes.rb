require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }
  post 'auth/login', to: 'sessions#login'
  mount Sidekiq::Web => "/sidekiq"
  resources :comments
  resources :post_types
  resources :posts
  resources :articles

  namespace :api do
    namespace :v1 do 
      resources :articles, :posts
    end
  end

  get 'search', to: 'articles#search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    get 'signout' => 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  root "post_types#index"
end
