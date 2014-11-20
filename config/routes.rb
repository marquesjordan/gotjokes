Gotjokes::Application.routes.draw do
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'createlogin'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # get "sessions/new"
  # get "jokes/index" => 'jokes#index', as: :jokes
  # get "jokes/new" => 'jokes#new', as: :new_joke
  # post "jokes/" => 'jokes#create'
  # get "jokes/edit"

  # get 'jokes/index'     =>    'jokes#index',    as: :jokes
  # get 'jokes/new'       =>    'jokes#new',      as: :new_jokes
  # get "jokes/:id"       =>    'jokes#show',     as: :joke
  # post 'jokes/create'   =>    'jokes#create' 
  # get "jokes/:id/edit"  =>    'jokes#edit',     as: :edit_joke
  # patch 'jokers/:id'     =>    'jokes#update'
  # delete 'jokes/:id'    =>    'jokes#destroy',  as: :delete_joke
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  

  resources :sessions
  
  resources :users 
  
  root 'users#index'
  
  resources :jokes

  resources :profiles

  resources :votes

  resources :user_comments

  


end
