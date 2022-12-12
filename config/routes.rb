Rails.application.routes.draw do
  root "pages#index"

  # session
  scope :in9foo7N do
    get "login", to: "session#new", as: :login
    post "login", to: "session#create"
    get "logout", to: "session#destroy", as: :logout
  end

  # blog posts
  scope :blog, as: :blog do
    resources :posts, only: [:index, :new, :create, :show]
  end
end
