Rails.application.routes.draw do

  resources :bio_changes

  resources :relationships

  resources :users do
    member do
      get 'bio_change_count'
    end
    collection do
      get 'all_bio_changes'
    end
  end

  get 'sign_up' => "users#new", as: 'sign_up'

  resources :sessions, only:[:new, :create, :destroy]
  get 'login' => "sessions#new", as: 'login'
  get 'logout' => "sessions#destroy", as: 'logout'

  root 'welcome#index'

end
