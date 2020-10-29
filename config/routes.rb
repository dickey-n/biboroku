Rails.application.routes.draw do
  devise_for :users
  root to: 'museums#index'

  resources :museums do
    resources :memos, only: [:create, :new, :show]
  end

  resources :users, only: :show
end
