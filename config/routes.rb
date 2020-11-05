Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :museums do
    resources :memos, only: [:new, :index, :show, :create, :destroy]
  end

  resources :users, only: :show
end
