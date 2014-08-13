Rails.application.routes.draw do
  resources :fournisseurs

  resources :etablissements

  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  devise_scope :user do
    get "users/autocomplete_entreprise_nom" => "users/registrations#autocomplete_entreprise_nom"
  end

  #resources :users
end
