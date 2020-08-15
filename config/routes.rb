Rails.application.routes.draw do
  resources :credit_cards, only:[:new, :show]
  root 'items#index'
  resources :users 
  resources :items
end
