Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'intro#index'

  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams', to: 'teams#create'
  get '/heroes', to: 'heroes#index'
  get '/heroes/new', to: 'heroes#new'
  post '/heroes', to: 'heroes#create'
  get '/heroes/:id', to: 'heroes#show'
  get '/heroes/:id/edit', to: 'heroes#edit'
  patch '/heroes/:id', to: 'heroes#update'
  delete '/heroes/:id', to: 'heroes#destroy'
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: "teams#show"
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'
end
