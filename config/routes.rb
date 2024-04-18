Rails.application.routes.draw do
  post '/games/start', to: 'games#start'
  get '/games/:id/score', to: 'games#score'
  post '/throws', to: 'throws#create'
end
