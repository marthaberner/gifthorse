Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'welcome#index'

  resources :users

  resources :bookmarks

  resources :sessions, only: [:new, :create, :destroy]

  match '/login',  to: 'sessions#new',         via: 'get'

  match '/logout', to: 'sessions#destroy',     via: 'delete'

  get '/api/bookmarks', to: 'bookmarks#create'

  get '/js/bookmark.js', to: 'bookmarks#js'

  get '/about', to: 'welcome#about'

  get '/friends', to: 'friends#index'
end
