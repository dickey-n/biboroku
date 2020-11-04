Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'

  resources :museums do
    resources :memos, only: [:create, :new, :show, :index]
  end

  resources :users, only: :show
end
