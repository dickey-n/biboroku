Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  namespace :admin do
    resources :museums, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :museums, only: [:index, :show] do
    resource :bookmarks, only: [:create, :destroy]

    resources :memos, only: [:new, :index, :show, :edit, :update, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end

    collection do
      get 'search'
    end
  end

  resources :users, only: :show
end
