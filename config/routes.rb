Rails.application.routes.draw do

  resources :movements
  root to: 'movements#index'

  resources :stocks
  resources :items
  resources :sectors
  resources :floors
  resources :images
  resources :types
  resources :statuses

  post 'to_move', to: 'movements#to_move', as: :to_move

  get 'dashboard', to: 'movements#dashboard', as: :dashboard
  #Dashboard reports
  get 'dashboard_for_items', to: 'movements#dashboard', as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
