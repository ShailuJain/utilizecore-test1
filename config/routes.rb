Rails.application.routes.draw do
  resources :service_types
  resources :parcels
  resources :addresses
  resources :users, except: [:new, :create] do
    member do
      put :deactivate
    end
  end
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  get '/reports', to: 'reports#index'
  get '/reports/:id', to: 'reports#download', as: 'download_report'

  post 'sign_up', to: 'users#create'
  get 'sign_up', to: 'users#new'
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
