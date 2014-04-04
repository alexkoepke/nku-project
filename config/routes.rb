NkuProject::Application.routes.draw do
 
  get "welcome/index"
  get "sessions/new"
  get "users/new"

  post 'login', to: "sessions#create"
  post 'logout', to: "sessions#destroy"
  
  resources :users
  resources :sessions

  root to: "welcome#index"

end
