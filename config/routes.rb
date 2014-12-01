Gotjokes::Application.routes.draw do


  resources :categories


  root 'application#index'


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'createlogin'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # additional joke routes for json and sql searches
  get  'jokes/search'   => 'jokes#search', as: :jokes_search  
  post 'jokes/search'   => 'jokes#search', as: :jokes_searchfilter 
  get 'jokes/welcome'   => 'jokes#jokeofday', as: :welcome_jokes   

  # default joke routes
  get 'jokes/index'     =>    'jokes#index',    as: :jokes
  get 'jokes/new'       =>    'jokes#new',      as: :new_jokes
  get "jokes/:id"       =>    'jokes#show',     as: :joke
  post 'jokes/create'   =>    'jokes#create' 
  get "jokes/:id/edit"  =>    'jokes#edit',     as: :edit_joke
  patch 'jokers/:id'    =>    'jokes#update'
  delete 'jokes/:id'    =>    'jokes#destroy',  as: :delete_joke
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  

  resources :sessions
  
  resources :users 
  
  resources :profiles

  resources :votes

  get 'user_comments/index'     =>    'user_comments#index',    as: :user_comments
  get 'user_comments/new'       =>    'user_comments#new',      as: :new_user_comments
  get "user_comments/:id"       =>    'user_comments#show',     as: :user_comment
  post 'user_comments/create'   =>    'user_comments#create',   as: :create_user_comment
  get "user_comments/:id/edit"  =>    'user_comments#edit',     as: :edit_user_comment
  patch 'user_comments/:id'     =>    'user_comments#update'
  delete 'user_comments/:id'    =>    'user_comments#destroy',  as: :delete_user_comment

  get 'searches/index' => 'searches#index', as: :searches


end
