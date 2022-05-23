Rails.application.routes.draw do

  devise_for :users,skip: [:password], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  namespace :user do
    get 'likes/create'
    get 'likes/destroy'
  end

  devise_scope :user do
    post 'user/guest_sign_in' => 'user/sessions#guest_sign_in'
  end

  scope module: :user do
    root 'homes#top'
    get '/about' => 'homes#about'
    get 'search' => 'memories#search'
    resources :districts, only: [:index, :show]
    resources :favorites, only: [:index, :create, :destroy]
    resources :memories, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :memories do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :memories, only: [:index, :show, :edit, :update]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
