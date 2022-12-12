Rails.application.routes.draw do
  root "pages#index"

  # session
  get "login", to: "session#new", as: :login
  post "login", to: "session#create"
  get "logout", to: "session#destroy", as: :logout
end
