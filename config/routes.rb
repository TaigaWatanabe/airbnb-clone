Rails.application.routes.draw do  
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'pages#home' 
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
    resources :photos, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
