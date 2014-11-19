Gotjokes::Application.routes.draw do
  
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
  
  resources :users 

  resources :jokes

  resources :profiles

  resources :votes

  resources :user_comments

  


end
