Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'
  resources :fashions do
    resources :comments, only:[:new,:create]
    
    resources :likes, only: [:create]
  end

  resource :profile, only: [:show,:edit,:update]
end

