Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :locations
  resources :beauty_places
  resources :employees

  resources :deals, only: [:index]
  resources :beauty_places do
    resources :deals
    # resources :deals, shallow: true
  end
  resources :beauty_places, has_many: :employees, shallow: true

  get '/searches/new', to: 'searches#new'
  post '/beauty_places/save', to: 'beauty_places#save'

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'sign-in' => 'users/sessions#new', :as => :new_user_session
    post 'sign-in' => 'users/sessions#create', :as => :user_session
    delete 'sign-out' => 'users/sessions#destroy', :as => :destroy_user_session
  end

end
