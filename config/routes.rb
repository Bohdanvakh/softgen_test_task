Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :patients
  devise_for :doctors

  get "up" => "rails/health#show", as: :rails_health_check

  resources :doctors
  resources :patients
  resources :appointments

  get '/doctors/home', to: 'doctors#index'
  get '/patients/home', to: 'patients#index'

  # Defines the root path route ("/")

  get '/permission_denied', to: 'home#error'
end
