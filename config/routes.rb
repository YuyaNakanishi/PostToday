Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'

  resource :timeline, only:[:show]

  resources :fashions 

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


  resource :profile, only: [:show,:edit,:update]
  resources :favorites, only: [:index]

  namespace :api, defaults: {format: :json} do
    scope '/fashions/:fashion_id' do
      resources :comments, only:[:index,:create]
      resource :like, only: [:show, :create, :destroy]
    end
  end

end


