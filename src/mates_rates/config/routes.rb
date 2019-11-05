Rails.application.routes.draw do
  
  
  
  get '/tools', to: 'tools#index'
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  devise_scope :user do
    root "users/registrations#edit"
  end

  resources :users, only: [:show] do
    resources :tools do
      resources :rentals
    end
    resources :rentals
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
