Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/profile/:id', to: 'users#show'
  post '/profile/:id/zip', to: 'users#zip'

  get '/login', to: 'sessions#show'
  
  get '/petplays/new', to: 'pet_play#new'

  get '/auth/:provider/callback', to: 'google#create'
  
  resources :pets, only: [:new, :create]
  
  get "/auth/failure", to: "google#create"
  delete "/logout" => "google#destroy"
end
