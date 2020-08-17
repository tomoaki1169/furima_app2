Rails.application.routes.draw do
  resources :users
  root 'items#index'
  resources :items, except: :show

  resources :items,only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults:{ format: 'json' }
    end
  end
end
