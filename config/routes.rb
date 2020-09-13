Rails.application.routes.draw do
  root 'items#index'
  get "item/purchase"  => "items#purchase"
  get "item/show" => "items#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
