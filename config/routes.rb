Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  resources :welcome, only: :index
  resources :users
  resources :profiles
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]

  get   '/users/:id/settings' => 'users#settings', as: :user_settings
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
end
