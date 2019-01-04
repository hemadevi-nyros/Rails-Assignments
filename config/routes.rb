Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "articles#index"
  resources :articles
end
