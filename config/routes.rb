Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  get "graphs/new"
  resources :events
  resources :graphs
  resources :homes
  get 'events/age/:age', to: 'events#by_age', as: 'events_by_age'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root :to => 'homes#top'
end
