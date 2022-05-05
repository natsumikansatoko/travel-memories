Rails.application.routes.draw do
  namespace :user do
    get 'favorites/index'
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :user do
    get 'memories/new'
    get 'memories/create'
    get 'memories/index'
    get 'memories/show'
    get 'memories/edit'
    get 'memories/update'
    get 'memories/destroy'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/withdrawal'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end

  devise_for :users,skip: [:password], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :memories, only: [:index, :show, :edit, :update]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
