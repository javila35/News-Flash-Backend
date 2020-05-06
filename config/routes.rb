Rails.application.routes.draw do
  resources :comments do
    end
  resources :bookmarks
  resources :users
  post '/auth', to: "auth#create"
  get '/current_user', to: 'auth#show'
end
