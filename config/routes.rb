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

  #routes to moves items
  post 'to_move', to: 'movements#to_move', as: :to_move

  #route fo comunication with app
  get 'tag_to_move:id_item', to: 'movements#tag_to_move'
  get 'items_to_app', to: 'items#items_to_app'
  get 'movements_to_app', to: 'movements#movements_to_app'
  get 'images_to_app', to: 'images#images_to_app'
  post 'app_to_move', to: 'movements#app_to_move'

  #routes test
  get 'test_app_move', to: 'movements#test_app_move', :via => [ :post]




  #Dashboard route
  get 'dashboard', to: 'movements#dashboard', as: :dashboard
  #Dashboard reports
  get 'for_product', to: 'movements#for_product', as: :for_product
  get 'for_sector', to: 'movements#for_sector', as: :for_sector
  get 'for_floor', to: 'movements#for_floor', as: :for_floor
  get 'availability_moves', to: 'movements#availability_moves', as: :availability_moves
  #Availabilities
  get 'availables_status', to: 'statuses#availables_status', as: :availables_status
  get 'availables_items', to: 'items#availables_items', as: :availables_items
  get 'availables_moves', to: 'movements#availables_items', as: :availables_moves





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
