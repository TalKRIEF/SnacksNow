Rails.application.routes.draw do
  devise_for :users
  root to: "snacks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :snacks do
    resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  patch '/bookings/:id/accept', to: "bookings#accept", as: "accept_booking"
  delete '/bookings/:id', to: "bookings#decline", as: "decline_booking"

  get "/dashboard", to: "pages#dashboard"

  # Defines the root path route ("/")
  # root "posts#index"
end
