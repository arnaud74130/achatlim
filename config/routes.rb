Rails.application.routes.draw do
  resources :observations

  resources :markets
  #
  #
  #resources :users, :except => [:new, :edit]
  resources :fncs, except: :new
  get 'fncs/marches/:market_id', to: 'fncs#new', as: :new_marche_fnc

  resources :fournisseurs

  resources :etablissements

  resources :consultations

  root to: 'visitors#index'
  devise_for :users

  resources :users do
    get :autocomplete_user_entreprise, :on => :collection
    get :autocomplete_user_fournisseur, :on => :collection
  end

end
