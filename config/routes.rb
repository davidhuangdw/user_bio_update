Rails.application.routes.draw do

  resources :users
  get 'sign_up' => "users#new", as: 'sign_up'

  resources :sessions, only:[:new, :create, :destroy]
  get 'login' => "sessions#new", as: 'login'
  get 'logout' => "sessions#destroy", as: 'logout'

  root 'welcome#index'

end
