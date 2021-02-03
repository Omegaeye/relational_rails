Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'intro#index'

  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams', to: 'teams#create'
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: "teams#show"
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'

  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  get '/players', to: 'players#create'
  post '/players', to: 'players#create'
  get '/players/:id', to: "players#show"
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
  delete '/players/:id', to: 'players#destroy'

  get '/heroes', to: 'heroes#index'
  get '/heroes/new', to: 'heroes#new'
  post '/heroes', to: 'heroes#create'
  get '/heroes/:id', to: 'heroes#show'
  get '/heroes/:id/edit', to: 'heroes#edit'
  patch '/heroes/:id', to: 'heroes#update'
  delete '/heroes/:id', to: 'heroes#destroy'
end
