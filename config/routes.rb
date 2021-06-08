Rails.application.routes.draw do
  get 'badges/index'
  get 'badges/show'
  get 'badges/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
