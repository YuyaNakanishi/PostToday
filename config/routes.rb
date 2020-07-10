Rails.application.routes.draw do
  devise_for :users

  root to: 'fashions#index'
  resources :fashions

end

