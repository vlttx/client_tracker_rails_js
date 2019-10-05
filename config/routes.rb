Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  
  root to: "application#home"
  resources :invoices
  resources :clients
  resources :projects
  resources :users
  get ‘facebook/callback’, to: ‘sessions#create’
  get ‘failure’, to: redirect(‘/’)
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
