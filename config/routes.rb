NkuProject::Application.routes.draw do
 
  get "welcome/index"
  get "sessions/new"
  get "users/new"

  post 'login', to: "sessions#create"
  get "sign_out", to: "sessions#destroy"
  get "edit", to: "users#edit"
  get "players", to: "players#index"
  get "play_game", to: "players#new"

  
  resources :users
  resources :sessions
  resources :players

  root to: "welcome#index"

end
