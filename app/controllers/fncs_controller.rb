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
  before_action :set_market, only: [:new, :create]  
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
 
 # GET fnc/marches/:market_id
  def new
    authorize Fnc  
    @fnc=@marche.fncs.new        
    @fnc.observations.build
    # TODO -----> @fnc.photos.build
    @fnc.etablissement_id=current_user.entreprise.id
    
  end


  # GET /fncs/1/edit
  def edit
    authorize @fnc
    @etablissement = current_user.entreprise
    @consultation = @fnc.market.consultation
    @marche = @fnc.market    
    @fnc.observations.build
    # TODO -----> @fnc.photos.build
  end

  # POST fncs/marches/:market_id
  def create    
    @creator =  FncCreator.build(@marche.fncs, current_user, fnc_params)    
    authorize @creator.fnc
    @fnc = @creator.fnc
    respond_to do |format|
      if @creator.save        
        format.html { redirect_to @fnc, notice: 'La fiche de non confirmité a été créé avec succès.' }
        format.json { render :show, status: :created, location: @fnc }
      else
        format.html { render :new }
        format.json { render json: @fnc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @fnc
    @creator = FncCreator.new(@fnc, current_user)
    respond_to do |format|
      if @creator.update(fnc_params)
        format.html { redirect_to @fnc, notice: 'La fiche de non confirmité a été modifié avec succès.' }
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
      format.html { redirect_to fncs_url, notice: 'La fiche de non confirmité a été détruite avec succès.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fnc
    @fnc = Fnc.find(params[:id])    
  end

  def set_market
    @marche = Market.find(params[:market_id])      
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def fnc_params
    params.require(:fnc).permit(:date_creation, :raison_litige, :numero_commande, :produits, :commande_passee, :livraison_demandee, :lot_ou_dlc, :observation_id, :instruction_avoir, :instruction_facture, :instruction_surv_prepa, :instruction_reprendre, :instruction_relivrer, :instruction_autre, :market, :respect_delais, :proprete_camion, :etat_emballage, :conformite_produit, :respect_dlc, :temperature_produit, :abs_tracabilite, :tarification, :market_id, :cloturee, :etablissement_id, :observations_attributes => [:id, :message, :user_id, :_destroy], :photos_attributes =>[:id, :image, :_destroy ])
  end
end
