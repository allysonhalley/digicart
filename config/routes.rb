Rails.application.routes.draw do
  resources :items
  resources :sectors
  root to: 'items#index'
  get 'dashboard_items', to: 'items#dashboard_items'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
