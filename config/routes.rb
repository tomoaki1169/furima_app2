Rails.application.routes.draw do
  resources :users
  root 'items#index'
  resources :items
end
