Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/results", to: "babies#search", as: :results
  resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]
end
