Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'

  resources :fashions do
    resources :comments, only:[:new,:create]
      resource :like, only: [:create, :destroy]
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


  resource :profile, only: [:show,:edit,:update]
  resources :favorites, only: [:index]
end


