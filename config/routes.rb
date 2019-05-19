Rails.application.routes.draw do
  resources :invoices
  resources :clients
  resources :projects
  resources :users
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :clients
  end

  resources :clients do
    resources :projects
  end
  resources :invoices do 
    resources :users
  end
  resources :projects do 
    resources :invoices
  end
end
