Rails.application.routes.draw do
  
  root to: "samples#home"
  get "/home" => "samples#home"
  
  resources :articles
  get "/index" => "articles#index"

end
