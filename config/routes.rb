Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/profile/:id', to: 'users#show'
  post '/profile/:id/zip', to: 'users#zip'

  get '/login', to: 'sessions#show'
  
  
  get '/auth/:provider/callback', to: 'google#create'
  
  resources :pets, only: [:new, :create, :edit, :update, :destroy]
  
  get "/auth/failure", to: "google#create"
  delete "/logout" => "google#destroy"
  
  get '/pet_plays/new', to: 'pet_plays#new'
  post '/pet_plays', to: 'pet_plays#create'
  resources :petplays, only: [:index, :show]
end
