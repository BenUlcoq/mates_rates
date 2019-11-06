Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tools do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:index, :show, :update, :destroy, :edit]
  
  post '/search', to: 'pages#redirect_to_results', as: 'redirect_to_results'
  get '/search/:query', to: 'pages#results', as: 'results'
  get '/browse', to: 'tools#index', as: 'browse'
  get '/users/:id', to: 'users#show', as: 'user_path'
  # get '/:category', to: 'pages#category', as: 'category'
  get '/:page', to: 'pages#show'

  root "pages#show", page: "home"

  
end
