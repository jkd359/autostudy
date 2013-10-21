Autostudy::Application.routes.draw do
  resources :posts

  get "admin" => "admin#index" 
  resources :resources

  resources :contents

  resources :courses

  resources :user_profiles

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
