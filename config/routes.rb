Rails.application.routes.draw do

  root :to => 'public#index'

  get 'show/:title', :to => 'public#show', :as => 'public_show'

  devise_for :users

  resources :charges

  #resourceful routes
  resources :meetings do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end

  resources :affiliates do
    member do
      get :delete
    end
  end

  resources :attendances do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
