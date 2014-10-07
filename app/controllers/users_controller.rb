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

class UsersController < ApplicationController

  before_filter :authenticate_user!
  after_action :verify_authorized

  def autocomplete_user_entreprise
    authorize current_user
    term = params[:term]
    entreprises_etb = Etablissement.where('nom LIKE ?', "%#{term}%").order(:nom).all.to_a
    entreprises_f = Fournisseur.where('nom LIKE ?', "%#{term}%").order(:nom).all.to_a
    entreprises = entreprises_etb + entreprises_f
    render :json => entreprises.map { |entreprise| {id: entreprise.id, label: entreprise.nom, value: entreprise.nom, entreprise_type: entreprise.class.name} }
  end
  
  def autocomplete_user_fournisseur
    authorize current_user
    term = params[:term]    
    entreprises = Fournisseur.where('nom LIKE ?', "%#{term}%").order(:nom).all.to_a    
    render :json => entreprises.map { |entreprise| {id: entreprise.id, label: entreprise.nom, value: entreprise.nom} }
  end



  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :entreprise_id, :entreprise_type)
  end

end
