Rails.application.routes.draw do

  resources :users, only: :update
  resources :capsules, only: %i[create update destroy]
  resources :badges, only: %i[index show update]

  # get 'capsules/destoy'
  # get 'badges/index'
  # get 'badges/show'
  # get 'badges/update'

  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/inbox' => 'pages#inbox', :as => :inbox
  get '/incoming' => 'pages#incoming', :as => :incoming
  get '/outgoing' => 'pages#outgoing', :as => :outgoing
  get '/opened' => 'pages#opened', :as => :opened
  get '/avatar' => 'pages#avatar', :as => :avatar
  get '/profile' => 'pages#profile', :as => :profile


  # post '/capsules' => 'capsules#create', :as => :capsules
  # delete '/capsule/:id' => 'capsules#destroy', :as => :capsule
  # patch '/capsule/:id' => 'capsules#update', :as => :capsule
  # get '/badges' => 'badges#index', :as => :badges
  # get '/badge/:id' => 'badges#show', :as => :badge
  # patch '/badge/:id' => 'badges#update', :as => :badge

  get '/test/' => 'pages#test', :as => :test

end
