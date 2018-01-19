Rails.application.routes.draw do
  root 'users#home'

  resources :users, only: [:new, :create, :update]
  
  resources :events do
    resources :availabilities, shallow: true do
      resources :approveds, only: [:create, :destroy]
    end
  end



  get '/events/:id/join', to: 'events#join'

  resources :sessions, only: [:create, :destroy]
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/profile/edit', to: 'users#edit'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  
  get '/possibilities', to: 'events#show'

  get '/sessions', to: 'sessions#redirect'

end
