NkuProject::Application.routes.draw do
 
  devise_for :users, :controllers => { :passwords => "passwords" }
  get "welcome/index"
  get "sessions/new"
  get "users/new"
  get "users/edit"
  get "communities/index"
  get "communities/new"
  # get "communities/edit"

  # post 'login', to: "sessions#create"
  get "sign_out", to: "sessions#destroy"
  get "edit", to: "users#edit"
  get "players", to: "players#index"
  get "play_game", to: "players#new"
  get "done_playing", to: "players#destroy"
  get "create_community", to: "communities#new"
  # get "edit_community", to: "communities#edit"
  get "profile", to: "user#show"
  get "start_playing/:id", to: "communities#player", as: "start_playing"


  
  resources :users

  resources :sessions
  resources :players
  resources :communities do
    resources :players
  end


  devise_scope :user do 
    root to: 'welcome#index'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # root to: "welcome#index"

end
