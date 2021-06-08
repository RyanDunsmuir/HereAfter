Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/inbox' => 'pages#inbox', :as => :inbox
  get '/capsules' => 'capsules#index', :as => :capsules
  get '/capsule/:id' => 'capsules#destroy', :as => :capsule
  get '/badges' => 'badges#index', :as => :badges

end
