Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:index, :new, :create]
  end
end
