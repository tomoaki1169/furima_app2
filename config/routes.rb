Rails.application.routes.draw do
  resources :credit_cards, only:[:new, :show]
  root 'items#index'

  resources :items, except: :show

  resources :items,only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults:{ format: 'json' }
    end
  end

  resources :users 
  resources :items

end
