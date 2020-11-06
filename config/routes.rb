Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  namespace :admin do
    resources :museums, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :museums, only: [:index, :show] do
    resources :memos, only: [:new, :index, :show, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :users, only: :show
end
