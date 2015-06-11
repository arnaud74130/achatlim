Rails.application.routes.draw do
  
  resources :horaire_livraisons
  resources :caracteristique_livraisons
  resources :famille_segments
  resources :observations

  resources :markets
  #
  #
  #resources :users, :except => [:new, :edit]
  resources :fncs, except: [:new, :create]
  get 'marches/:market_id/fncs/new', to: 'fncs#new', as: :new_market_fnc
  post 'marches/:market_id/fncs', to: 'fncs#create', as: :market_fncs
  patch 'marches/:market_id/fncs/:id', to: 'fncs#update', as: :market_fnc

  resources :fournisseurs

  resources :etablissements do
    resources :point_livraisons
  end

  resources :consultations

  root to: 'visitors#index'
  
  devise_for :users

  resources :users do
    get :autocomplete_user_entreprise, :on => :collection
    get :autocomplete_user_fournisseur, :on => :collection
  end

end
