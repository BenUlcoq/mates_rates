Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :tools do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:index, :show, :update, :destroy, :edit]
  get '/users/:id', to: 'users#show'
  get '/:page', to: 'pages#show'

  root "pages#show", page: "home"

  
end
