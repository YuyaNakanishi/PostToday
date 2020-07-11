Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'
  resources :fashions

  resource :profile ,only: [:show,:edit,:update]
end

