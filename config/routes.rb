Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks', registrations: 'registrations' }
  
  root to: "application#home"
  resources :invoices
  resources :clients
  resources :projects
  resources :users


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
