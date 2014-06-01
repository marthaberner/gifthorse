Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'welcome#index'

  resources :users

  resources :bookmarks

  resources :sessions, only: [:new, :create, :destroy]

  match '/login',  to: 'sessions#new',         via: 'get'
  
  match '/logout', to: 'sessions#destroy',     via: 'delete'

  get '/bookmarks', to: 'bookmarks#new'

  post '/bookmarks', to: 'bookmarks#new'

end
