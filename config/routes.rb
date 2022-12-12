Rails.application.routes.draw do
  root "pages#index"

  # session
  get "login", to: "session#new", as: :login
  post "login", to: "session#create"
  get "logout", to: "session#destroy", as: :logout

  # blog posts
  scope :blog, as: :blog do
    resources :posts, only: [:index, :new, :create, :show]
  end
end
