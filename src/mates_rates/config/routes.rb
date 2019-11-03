Rails.application.routes.draw do
  
  
  devise_for :user, :controllers => { registrations: 'users/registrations' }
  
  devise_scope :user do
    root "users/registrations#edit"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
