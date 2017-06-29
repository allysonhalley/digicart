Rails.application.routes.draw do

  root to: 'movements#index'

  resources :movements
  resources :stocks
  resources :items
  resources :sectors
  resources :floors
  resources :images
  resources :types
  resources :statuses

  get 'dashboard', to: 'movements#dashboard', as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
