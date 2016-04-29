Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users

  get '/index', to: 'beauty_places#index'
  devise_for :users, :skip => [:sessions]
  as :user do
    get 'sign-in' => 'users/sessions#new', :as => :new_user_session
    post 'sign-in' => 'users/sessions#create', :as => :user_session
    delete 'sign-out' => 'users/sessions#destroy', :as => :destroy_user_session
  end
  # devise_for :users, controllers: { sessions: "users/sessions" }
end
