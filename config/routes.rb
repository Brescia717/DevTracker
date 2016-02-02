Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => {
    omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'
  }

  resources :welcome, only: :index
  resources :users
  resources :profiles

  get   '/users/:id/settings' => 'users#settings', as: :user_settings
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'
  match '/auth/failure', to: redirect('/'), via: 'get'
end
