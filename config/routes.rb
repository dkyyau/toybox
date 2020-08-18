Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toys do
    resources :offers, only: [ :index, :show, :new, :create, :edit, :update ]
  end
  resources :offers, only: [ :destroy ]
  resources :users, only: [ :show ]
end
