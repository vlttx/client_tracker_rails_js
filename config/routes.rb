Rails.application.routes.draw do
  resources :invoices
  resources :clients
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  resources :clients do
    resources :projects
  end
  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :clients
  end
  resources :users do 
    resources :clients 
  end
end
