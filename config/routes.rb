Rails.application.routes.draw do

  get 'capsules/create'
  get 'capsules/destoy'

  get 'badges/index'
  get 'badges/show'
  get 'badges/update'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/inbox' => 'pages#inbox', :as => :inbox
  post '/capsules' => 'capsules#index', :as => :capsules
  delete '/capsule/:id' => 'capsules#destroy', :as => :capsule
  get '/badges' => 'badges#index', :as => :badges
  get '/badge/:id' => 'badges#show', :as => :badge
end
