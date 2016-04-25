Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :users

  get '/index', to: 'beauty_places#index'
end
