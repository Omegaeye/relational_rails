Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'intro#index'

  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams', to: 'teams#create'
  # get '/teams/:id', to: "teams#show"
end
