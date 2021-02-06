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
  get 'teams/:id/players', to: 'teams#p_c_index'
  get '/teams/:id/players/new', to: 'players#new'
  post 'teams/:id/players', to: 'players#create'
  patch 'teams/:id/players', to: 'teams#p_c_index'
  get '/players/:id', to: "players#show"
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
  delete '/players/:id', to: 'players#destroy'

  get '/heroes', to: 'heroes#index'
  get '/heroes/:id/mounts', to: 'heroes#p_c_index'
  patch 'heroes/:id/mounts', to: 'heroes#p_c_index'
  get '/heroes/new', to: 'heroes#new'
  post '/heroes', to: 'heroes#create'
  patch '/heroes', to: 'heroes#index'
  get '/heroes/:id', to: 'heroes#show'
  get '/heroes/:id/edit', to: 'heroes#edit'
  patch '/heroes/:id', to: 'heroes#update', as: 'hero'
  delete '/heroes/:id', to: 'heroes#destroy'

  get '/mounts', to: 'mounts#index'
  get '/heroes/:id/mounts/new', to: 'mounts#new'
  post '/heroes/:id/mounts', to: 'mounts#create'
  get '/mounts/:id', to: "mounts#show"
  get '/mounts/:id/edit', to: 'mounts#edit'
  patch '/mounts', to: 'mounts#index'
  patch '/mounts/:id', to: 'mounts#update'
  delete '/mounts/:id', to: 'mounts#destroy'
end
