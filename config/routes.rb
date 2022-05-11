Rails.application.routes.draw do

  devise_for :users,skip: [:password], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :favorites, only: [:index, :create, :destroy]
    resources :memories, only: [:new, :create, :index, :show, :edit, :update, :destory]
    resource :users, only: [:show, :edit, :update]
    get '/users/unsubscribe' => 'users#unsubscribe'
    patch '/users/withdrawal' => 'users#withdrawal'
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :memories, only: [:index, :show, :edit, :update]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
