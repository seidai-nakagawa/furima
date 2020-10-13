Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources "items", only: [:new, :create, :edit] do
  end
  resources "items", only: [:show] do
    collection do
      get 'purchase'
    end
  end
  resources :users, only: :show
end
