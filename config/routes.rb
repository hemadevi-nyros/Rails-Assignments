Rails.application.routes.draw do
  get 'employees/index'
  get 'employees/show'
  get 'employees/new'
  get 'employees/edit'
  resources :articles
  root to: "articles#index"
end
