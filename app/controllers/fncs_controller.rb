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

class FncsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_fnc, only: [:show, :edit, :update, :destroy]
  
  after_action :verify_authorized

  def index
    authorize Fnc
    if current_user.entreprise_type=='Etablissement'
      @fncs = Fnc.fiches_pour_etablissement(current_user.entreprise, "ALL")
    else
      @fncs = Fnc.fiches_pour_fournisseur(current_user.entreprise, "ALL")
    end
    
  end

  def show
    authorize @fnc
    @etablissement = current_user.entreprise
    @consultation = @fnc.market.consultation
    @marche = @fnc.market    
  end

  def new
    authorize Fnc
    @fnc = Fnc.new
    market = Market.find(params[:market_id])
    @fnc.market = market
    @fnc.observations.build
  end

  # GET /fncs/1/edit
  def edit
    authorize @fnc
    @etablissement = current_user.entreprise
    @consultation = @fnc.market.consultation
    @marche = @fnc.market    
    @fnc.observations.build
  end

  def create
    @fnc = Fnc.new(fnc_params)
    authorize @fnc
    respond_to do |format|
      if @fnc.save
        format.html { redirect_to @fnc, notice: 'Fnc was successfully created.' }
        format.json { render :show, status: :created, location: @fnc }
      else
        format.html { render :new }
        format.json { render json: @fnc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @fnc
    respond_to do |format|
      if @fnc.update(fnc_params)
        format.html { redirect_to @fnc, notice: 'Fnc was successfully updated.' }
        format.json { render :show, status: :ok, location: @fnc }
      else
        format.html { render :edit }
        format.json { render json: @fnc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @fnc
    @fnc.destroy
    respond_to do |format|
      format.html { redirect_to fncs_url, notice: 'Fnc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fnc
    @fnc = Fnc.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fnc_params
    params.require(:fnc).permit(:date_creation, :raison_litige, :numero_commande, :produits, :commande_passee, :livraison_demandee, :lot_ou_dlc, :observation_id, :instruction_avoir, :instruction_facture, :instruction_surv_prepa, :instruction_reprendre, :instruction_relivrer, :instruction_autre, :market, :respect_delais, :proprete_camion, :etat_emballage, :conformite_produit, :respect_dlc, :temperature_produit, :abs_tracabilite, :tarification, :market_id, :etat,:observations_attributes => [:id, :message, :user_id, :_destroy])
  end
end
