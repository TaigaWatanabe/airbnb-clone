Rails.application.routes.draw do  
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }
  root 'pages#home' 
  get '/search', to: 'pages#search'
  resources :users, only: :show
  resources :rooms do
    member do
      get :listing
      get :price
      get :description
      get :photos
      get :amenities
      get :location
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: :create
  end

  get '/your_reservations', to: 'reservations#your_reservations'
  get '/your_trips', to: 'reservations#your_trips'
  resources :reviews, only: :create
end
