Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'welcome#index'

  resources :users

  resources :bookmarks

  resources :sessions, only: [:create, :destroy]

  get '/bookmarks', to: 'bookmarks#new'

  post '/bookmarks', to: 'bookmarks#new'

end
