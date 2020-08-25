Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults:{ format: 'json' }
    end
    resources :purchases, only: [:index] do
      member do
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults:{ format: 'json' }
      get 'search'
    end
  end
  resources :users 
  resources :credit_cards, only: [:new, :show, :create, :destroy] do
    post 'credit_cards/:id', to: 'credit_cards#show'
  end
end
