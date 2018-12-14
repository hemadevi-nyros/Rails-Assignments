Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'authors/index'
  get 'authors/show'
  get 'employees/index'
  get 'employees/show'
  get 'employees/new'
  get 'employees/edit'
  resources :articles
  root to: "articles#index"
end
