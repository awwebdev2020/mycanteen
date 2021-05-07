Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'
  get "meals", to: "pages#index"
  get "meals/new", to: "pages#new"
  post "meals", to: "pages#create"
  get "meals/:id/edit", to: "pages#edit"
  patch "meals/:id", to: "pages#update"
  delete "meals/:id", to: "pages#destroy"
  get "meals/:id", to: "pages#show", as: :meal

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
