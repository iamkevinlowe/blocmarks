Rails.application.routes.draw do

  post :incoming, to: 'incoming#create'
  devise_for :users
  resources :users, only: [:show]
  resources :topics, only: [:index, :show, :create, :destroy] do
    resources :bookmarks, only: [:show, :create, :update, :destroy]
  end
  root to: 'welcome#index'
end
