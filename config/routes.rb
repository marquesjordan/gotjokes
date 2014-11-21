Gotjokes::Application.routes.draw do
  

  root 'application#index'

  # get "jokes/index" => 'jokes#index', as: :jokes
  # get "jokes/new" => 'jokes#new', as: :new_joke
  # post "jokes/" => 'jokes#create'
  # get "jokes/edit"

  get 'jokes/index'     =>    'jokes#index',    as: :jokes
  get 'jokes/new'       =>    'jokes#new',      as: :new_jokes
  get "jokes/:id"       =>    'jokes#show',     as: :joke
  post 'jokes/create'   =>    'jokes#create' 
  get "jokes/:id/edit"  =>    'jokes#edit',     as: :edit_joke
  patch 'jokes/:id'     =>    'jokes#update'
  delete 'jokes/:id'    =>    'jokes#destroy',  as: :delete_joke
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  resources :profiles

  resources :votes

  get 'user_comments/index'     =>    'user_comments#index',    as: :user_comments
  get 'user_comments/new'       =>    'user_comments#new',      as: :new_user_comments
  get "user_comments/:id"       =>    'user_comments#show',     as: :user_comment
  post 'user_comments/create'   =>    'user_comments#create',   as: :create_user_comment
  get "user_comments/:id/edit"  =>    'user_comments#edit',     as: :edit_user_comment
  patch 'user_comments/:id'     =>    'user_comments#update'
  delete 'user_comments/:id'    =>    'user_comments#destroy',  as: :delete_user_comment

end
