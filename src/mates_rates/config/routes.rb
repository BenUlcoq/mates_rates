Rails.application.routes.draw do
  
  
  
  get '/tools', to: 'tools#index'
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  devise_scope :user do
    root "users/registrations#edit"
  end

  resources :tools do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:index, :show, :update, :destroy, :edit]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
