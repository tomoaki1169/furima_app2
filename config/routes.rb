Rails.application.routes.draw do
  get 'credit_cards/new'
  get 'credit_cards/show'
  resources :credit_cards, only:[:new, :show]
  root 'items#index'
  resources :users 
    
  resources :items, except: :show
end
