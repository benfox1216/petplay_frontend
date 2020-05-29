Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/auth/:provider/callback', to: 'google#create'
  # get '/auth/failure', to: redirect('/')
end
