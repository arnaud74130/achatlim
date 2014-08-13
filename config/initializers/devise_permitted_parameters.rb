module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nom
    devise_parameter_sanitizer.for(:sign_up) << :prenom    
    devise_parameter_sanitizer.for(:sign_up) << :entreprise_id
    devise_parameter_sanitizer.for(:sign_up) << :entreprise_type    
    devise_parameter_sanitizer.for(:sign_up) << :role    


    devise_parameter_sanitizer.for(:account_update) << :nom
    devise_parameter_sanitizer.for(:account_update) << :prenom    
    devise_parameter_sanitizer.for(:account_update) << :entreprise_id
    devise_parameter_sanitizer.for(:account_update) << :entreprise_type
    devise_parameter_sanitizer.for(:account_update) << :role
  end

end

DeviseController.send :include, DevisePermittedParameters
