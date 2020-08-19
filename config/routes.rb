Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/profile", to: 'pages#profile'
  get "/bookings", to: 'pages#bookings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toys do
    resources :offers, only: [ :index, :new, :create, :edit, :update ]
  end
  resources :offers, only: [ :show, :destroy ]
  resources :users, only: [ :show ]
end
