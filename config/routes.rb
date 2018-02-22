Rails.application.routes.draw do
  
  get '/users/:id/orders', to: 'users#orders'
  get '/products', to: 'products#index' 
end
