Rails.application.routes.draw do
  root 'items#index'
  get  "item/purchase"  => "items#purchase"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
