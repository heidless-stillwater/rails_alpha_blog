Rails.application.routes.draw do
  get "category/index"
  get "category/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  # dispay all routes
  # rails routes --expanded

  get "/about", controller: "pages", action: :about


  resources :articles, only: %i[index show new create edit update destroy]
  # resources :articles

  # resources :users, only: %i[index show new create update destroy]
  get "/signup", controller: "users", action: :new

  get "login", controller: "sessions", action: :new
  post "login", controller: "sessions", action: :create
  delete "logout", controller: "sessions", action: :destroy

  resources :users, except: [:new]

  resources :categories, except: [:destroy]
end
