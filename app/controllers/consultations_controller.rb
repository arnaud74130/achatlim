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

class ConsultationsController < ApplicationController
  before_filter :authenticate_user!


  before_action :set_entreprises
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  def index
    authorize Consultation
    @consultations = current_user.entreprise.consultations
  end

  def new
    authorize Consultation
    @consultation = current_user.entreprise.consultations.build
    @consultation.markets.first_or_initialize
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    authorize @consultation
    can_save=true
    unless @consultation.etablissements.include? current_user.entreprise
      flash[:error]="Attention votre établissement doit être coché !"
      can_save=false
    end

    respond_to do |format|
      if can_save && @consultation.save 
        format.html { redirect_to @consultation, notice: 'La consultation a été créé avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    authorize @consultation
  end

  def edit
    authorize @consultation
  end

  def update
    authorize @consultation
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @consultation
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_consultation
    #@consultation = current_user.entreprise.consultations.find(params[:id]) #FIXME, find not working with returned array instead of active relation grrr....
    @consultation = Consultation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def consultation_params
    params.require(:consultation).permit(:code, :libelle, :debut, :fin, :user_id, :etablissement_ids => [], :markets_attributes => [:id, :code, :fournisseur_nom, :_destroy])
  end


  def set_entreprises
    @entreprise = current_user.entreprise
    @etablissements= Etablissement.all
  end
end
