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
  get 'dashboard_for_type', to: 'movements#for_type', as: :dashboard_for_type
  get 'dashboard_for_date', to: 'movements#for_date', as: :dashboard_for_date
  get 'dashboard_for_sector', to: 'movements#for_sector', as: :dashboard_for_sector
  get 'dashboard_for_floor', to: 'movements#for_floor', as: :dashboard_for_floor



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
