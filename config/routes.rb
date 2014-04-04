NkuProject::Application.routes.draw do
 
  get "welcome/index"
  get "sessions/new"
  get "users/new"

  post 'login', to: "sessions#create"
  get "sign_out", to: "sessions#destroy"
  get "edit", to: "users#edit"
  
  resources :users
  resources :sessions

  root to: "welcome#index"

end
