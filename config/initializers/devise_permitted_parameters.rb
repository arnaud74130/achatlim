module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nom << :prenom << :telephone
    devise_parameter_sanitizer.for(:account_update) << :nom << :prenom << :telephone
  end

end

DeviseController.send :include, DevisePermittedParameters
