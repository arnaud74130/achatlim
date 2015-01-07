#     AchatLim - Plateforme Collaborative Achat du Limousin
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # DEVISE: Les "permitted parameters" de devise sont dans les "initializers"
  # MAIS il semble/semblait que l'initialization ne se faisait pas ou mal
  # si cela se produit, utiliser le code ci-dessous

  # before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private

  def user_not_authorized
    flash[:alert] = "Accès interdit."
    redirect_to (request.referrer || root_path)
  end

  def after_sign_in_path_for(resource)
    #consultations_path
    unless current_user.visitor?    
      consultations_path
    end
  end

  #	protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :nom << :prenom << :telephone
  #   devise_parameter_sanitizer.for(:account_update) << :nom << :prenom << :telephone
  # end

end
