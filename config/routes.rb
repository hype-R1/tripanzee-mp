Rails.application.routes.draw do
  resources :adventures, only:[:create, :index]
  resources :attractions, only:[:create, :index]
  resources :newtrips, only:[:create, :index, :destroy]
  resources :users, only: [:create ]
  resources :oldtrips, only: [:create, :index, :update ]
  

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/tripanzee", to: "users#show"
  get "/places", to: "googleplaces#index"
  get "/hotels", to: "hotels#index"

  get "/mytrips", to: 'users#my_trips'
  get "/mynewtrip", to: 'users#my_newtrips'


  get "/oldtripnumber", to: 'users#count'
  get "/newtripnumber", to: 'users#newtripcount'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }



end
