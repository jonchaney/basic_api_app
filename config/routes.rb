Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/:id/orders', to: 'orders#index'
  get '/orders', to: 'orders#sales_breakdown' 
end
