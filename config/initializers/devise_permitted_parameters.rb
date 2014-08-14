module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nom << :prenom << :role << :entreprise_id << :entreprise_type
    devise_parameter_sanitizer.for(:account_update) << :nom << :prenom << :role << :entreprise_id << :entreprise_type
  end

end

DeviseController.send :include, DevisePermittedParameters
