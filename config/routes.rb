Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get  "item/purchase"  => "items#purchase"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :items,only: [:new, :create] do
  resources :users,only: [:show,] do
end
end
end
