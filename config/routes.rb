Rails.application.routes.draw do
  root to: 'pages#home'
   resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
end
