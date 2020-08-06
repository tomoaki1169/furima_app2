Rails.application.routes.draw do
  resources :users
  root to : 'items#index'
  resources :items,except: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
