Rails.application.routes.draw do
  resources :comments
  resources :bookmarks
  resources :users, param: :username
  post '/auth', to: "auth#create"
  get '/current_user', to: 'auth#show'
end
