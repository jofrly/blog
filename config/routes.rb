Rails.application.routes.draw do
  root "pages#index"

  # session
  scope ENV.fetch("SESSION_SCOPE") do
    get "login", to: "session#new", as: :login
    post "login", to: "session#create"
    get "logout", to: "session#destroy", as: :logout
  end

  # blog posts
  scope :blog, as: :blog do
    resources :posts, only: [:index, :new, :create, :show, :edit, :update]
  end
end
