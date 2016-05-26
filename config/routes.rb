Rails.application.routes.draw do
  root 'static_pages#home'
  resources :locations
  resources :beauty_places
  resources :employees

  resources :deals, only: [:index, :show]
  # resources :deals, do
  #   resources :searches
  # end

  resources :beauty_places, has_many: :employees, shallow: true
  resources :beauty_places do
    resources :deals
    # resources :deals, shallow: true
  end

  get '/search/deals', to: 'search#deals'
  get '/sort_by_discount', to: 'search#discount_descending', as: 'discount_descending'
  post '/beauty_places/save', to: 'beauty_places#save'

  devise_for :users, :skip => [:sessions],
                     :controllers => {
                       :omniauth_callbacks => "users/omniauth_callbacks",
                       :registrations => "users/registrations",
                       :confirmations => "users/confirmations"
                     }
  as :user do
    get 'sign-in' => 'users/sessions#new', :as => :new_user_session
    post 'sign-in' => 'users/sessions#create', :as => :user_session
    delete 'sign-out' => 'users/sessions#destroy', :as => :destroy_user_session
  end

  # must be below devise_for for
  resources :users, only: [:index, :show, :destroy, :update, :delete]
end
