Rails.application.routes.draw do
  devise_for :users
  root to: 'museums#index'

  resources :museums
end
