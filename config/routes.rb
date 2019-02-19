Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
  get "/results", to: "babies#search", as: :results
  resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
end
