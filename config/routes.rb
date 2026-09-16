Rails.application.routes.draw do
  resources :articles

  get "/login", to: "sessions#new"        #shows the login form
  post "/login", to: "sessions#create"    #processes the login
  delete "/logout", to: "sessions#destroy" #processes logout

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/account", to: "users#show"
  delete "/users", to: "users#destroy"

end
