Rails.application.routes.draw do
  resources :projects
  resources :invoices
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  resources :clients
  resources :users
  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clients do
  	resources :projects
  end
end
