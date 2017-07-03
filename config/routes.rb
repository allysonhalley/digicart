Rails.application.routes.draw do

  resources :movements
  resources :stocks
  resources :items
  resources :sectors
  resources :floors
  resources :images
  resources :types
  resources :statuses

  root to: 'movements#index'

  post 'to_move', to: 'movements#to_move', as: :to_move
  post 'tag_to_move', to: 'movements#tag_to_move', as: :tag_to_move

  get 'dashboard', to: 'movements#dashboard', as: :dashboard
  #Dashboard reports
  get 'for_product', to: 'movements#for_product', as: :for_product
  get 'timeline', to: 'movements#timeline', as: :timeline
  get 'for_sector', to: 'movements#for_sector', as: :for_sector
  get 'for_floor', to: 'movements#for_floor', as: :for_floor




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
