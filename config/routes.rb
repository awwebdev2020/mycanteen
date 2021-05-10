Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  resources :meals do
    resources :bookings, only: [:create]
  end

  namespace :user do
    resources :meals, only: [:index, :destroy]
    resources :bookings, only: :index
  end

  resources :bookings, only: [:show, :destroy, :update]

  #get "meals", to: "meals#index"
  #get "meals/new", to: "meals#new"
  #post "meals", to: "meals#create"
  #get "meals/:id/edit", to: "meals#edit"
  #patch "meals/:id", to: "meals#update"
  #delete "meals/:id", to: "meals#destroy"
  #get "meals/:id", to: "meals#show", as: :meal

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
