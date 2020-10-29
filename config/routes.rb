Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources "items", only: [:new, :create, :edit, :update] do
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
  resources "items", only: [:show] do
    collection do
      get 'purchase'
    end
  end
  resources :users, only: :show
  resources :items, only: [:new, :create] do
  end
end
