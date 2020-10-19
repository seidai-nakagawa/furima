Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources "items", only: [:new, :create] do
  end
  resources "items", only: [:show] do
    resource :purchases do
      member do
        get  "buy"
        post "pay"
      end
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
  resources :users, only: :show
  resources :items, only: [:new, :create] do
  end
end
