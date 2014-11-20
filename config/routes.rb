Gotjokes::Application.routes.draw do
  
  # scope 'api', defaults: {format: :json} do
  #   resources :jokes
  # end

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

  resources :user_comments

end
