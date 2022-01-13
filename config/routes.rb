Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, { only: %i[update index] }
  get 'check_price', { to: 'products#check_price' }
  get 'offer', { to: 'products#offer' }
end
