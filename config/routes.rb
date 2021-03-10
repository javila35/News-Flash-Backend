Rails.application.routes.draw do
  resources :comments
  resources :bookmarks
  resources :users, except: :show
  get "users/:username", to: "users#show"
  post '/auth', to: "auth#create"
  get '/current_user', to: 'auth#show'
end
