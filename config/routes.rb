Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'

  resource :timeline, only:[:show]

  resources :fashions do
    resources :comments, only:[:index,:new,:create]
      resource :like, only: [:show, :create, :destroy]
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


  resource :profile, only: [:show,:edit,:update]
  resources :favorites, only: [:index]
end


