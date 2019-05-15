Rails.application.routes.draw do
  resources :invoices
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :clients
  get '/auth/facebook/callback' => 'sessions#create'
  root to: "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
