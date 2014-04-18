NkuProject::Application.routes.draw do
 
  devise_for :users, :controllers => { :passwords => "passwords" }
  get "welcome/index"
  get "sessions/new"
  get "users/new"

  # post 'login', to: "sessions#create"
  get "sign_out", to: "sessions#destroy"
  get "edit", to: "users#edit"
  get "players", to: "players#index"
  get "play_game", to: "players#new"
  get "done_playing", to: "players#destroy"

  
  resources :users
  resources :sessions
  resources :players

  devise_scope :user do 
    root to: 'welcome#index'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # root to: "welcome#index"

end
