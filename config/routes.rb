Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new, :create, :update]
  
  resources :events do
    resources :availabilities, shallow: true
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/dashboard', to: 'users#dashboard'

  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/profile/edit', to: 'users#edit'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  
  
end
