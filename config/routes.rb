Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/product" => "products#show"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  ### suppliers

  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"

  ### users

  post "/users" => "users#create" #create account

  ### sessions

  post "/sessions" => "sessions#create" #log-in as user
  
  ### orders

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  ### carted products

  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
end
