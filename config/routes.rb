Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'welcome#index'

  resources :users do
    resources :friendships
  end

  resources :bookmarks

  resources :sessions, only: [:new, :create, :destroy]

  match '/login', to: 'sessions#new', via: 'get'

  match '/logout', to: 'sessions#destroy', via: 'delete'

  get '/api/bookmarks', to: 'bookmarks#create'

  get '/js/bookmark.js', to: 'bookmarks#js'

  get '/about', to: 'welcome#about'

  get 'users/:user_id/friendships', to: 'friendships#show', as: :pending_friendships

  put 'friendships/:id', to: 'friendships#update', as: :update_friendship

  get 'welcome/intro_test.html', to: 'welcome#intro'

end
