Rails.application.routes.draw do
  get 'profile/show'
  root 'events#index'
  devise_for :users
  resources :events
  resources :profile, only: [:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end