Rails.application.routes.draw do
  get 'sessions/new'
  get "log_out", to: "sessions#destroy", :as => "log_out"
  get "log_in", to: "sessions#new", :as => "log_in"
  get "sign_up", to: "users#new", :as => "sign_up"
  resources :articles, :users, :sessions
  root to: "articles#index"
  resources :articles do
    resources :comments, shallow: true
  end
  get 'articles/:id', to: 'articles#show'
  match 'users', to: 'users#show', via: [:get, :post]
end
