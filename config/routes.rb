Rails.application.routes.draw do
  get 'babies/index'
  get 'babies/show'
  get 'babies/new'
  get 'babies/create'
  get 'babies/edit'
  get 'babies/update'
  get 'babies/destroy'
  root to: 'pages#home'
   resources :babies do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
end
