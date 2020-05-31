Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/profile/:id', to: 'users#show'
  post '/profile/:id/zip', to: 'users#zip'

  get '/login', to: 'sessions#show'

  get '/auth/:provider/callback', to: 'google#create'
  get "/auth/failure", to: "google#create"
  delete "/logout" => "google#destroy"

  get '/petplays', to: 'pet_plays#index'
end
