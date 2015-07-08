Rails.application.routes.draw do

  post :incoming, to: 'incoming#create'
  devise_for :users
  resources :users, only: [:show]
  resources :topics
  root to: 'welcome#index'
end
