Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  root 'items#index'
  resources :users 
    
  resources :items, except: :show
end
