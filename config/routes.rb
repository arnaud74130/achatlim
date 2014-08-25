Rails.application.routes.draw do
  resources :fournisseurs

  resources :etablissements

  resources :consultations

  root to: 'visitors#index'
  devise_for :users

  resources :users do
  	get :autocomplete_user_entreprise, :on => :collection
  end
end
