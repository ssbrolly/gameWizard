Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    get '/like_users', to: 'users#like'
    get '/users/:tag', to: 'users#tag'
    resources :users, only: :update
    resources :tags, only: [:index, :create, :destroy]
  end

  #Do not place any routes below this one
  get '*other', to: 'static#index'
end
