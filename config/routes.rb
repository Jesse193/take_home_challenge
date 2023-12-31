Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :customer_subscriptions, only: [:create, :update]
      resources :customer do
        resources :customer_subscriptions, only: [:index], to: 'customer_subscriptions#index'
      end
    end
  end
end
