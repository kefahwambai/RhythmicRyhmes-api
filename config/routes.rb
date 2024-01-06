Rails.application.routes.draw do
  resources :reviews
  resources :posts
  resources :users
  resources :sessions

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 

end
