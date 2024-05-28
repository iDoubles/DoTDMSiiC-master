Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users, only: %i[index show destroy]

  resources :projects, only: %i[index show] do
    member do
      post :join
    end
    resources :topics, only: :create
    resources :tasks, only: :create
  end

  resources :tasks, only: %i[update destroy] do
    member do
      post :join
    end
  end
  resources :topics, only: %i[update destroy]

  resource :my, only: :show, controller: :my do
    get :projects
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
