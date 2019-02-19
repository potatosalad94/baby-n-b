Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
end
