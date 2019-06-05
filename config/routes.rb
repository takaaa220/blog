Rails.application.routes.draw do
  root "posts#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :posts, param: :pid

  namespace :admin do
    resources :posts, param: :pid do
      post "toggle", on: :member
    end
  end
end
