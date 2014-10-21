Rails.application.routes.draw do
  resources :observations

  resources :markets
  #
  #
  #resources :users, :except => [:new, :edit]
  resources :fncs, except: [:new, :create]
  get 'fncs/marches/:market_id/new', to: 'fncs#new', as: :new_market_fnc
  post 'fncs/marches/:market_id', to: 'fncs#create', as: :market_fncs

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
