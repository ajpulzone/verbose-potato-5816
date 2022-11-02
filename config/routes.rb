Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "customers/:id", to: "customers#show"

  post "customers/:customer_id/items", to: "customer_items#create"

  get "items", to: "items#index"

  get "supermarkets/:supermarket_id", to: "supermarkets#show"
end
