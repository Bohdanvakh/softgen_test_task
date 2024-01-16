Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :patients
  devise_for :doctors

  get "up" => "rails/health#show", as: :rails_health_check

  resources :doctors, only: [:index, :show]
  resources :patients, only: [:index, :show]
  resources :appointments, only: [:new, :create, :edit, :update]

  get '/doctors/home', to: 'doctors#index'
  get '/patients/home', to: 'patients#index'
  get '/permission_denied', to: 'home#error'
  root to: 'home#root'
end
