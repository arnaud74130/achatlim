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

class FournisseursController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_fournisseur, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @fournisseurs = Fournisseur.all
    authorize Fournisseur
  end

  def show
    authorize @fournisseur    
  end

  def new
    @fournisseur = Fournisseur.new
    authorize @fournisseur 
  end

  def edit
    authorize @fournisseur 
  end

  def create
    @fournisseur = Fournisseur.new(fournisseur_params)
    authorize @fournisseur 
    respond_to do |format|
      if @fournisseur.save
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @fournisseur 
    respond_to do |format|
      if @fournisseur.update(fournisseur_params)
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @fournisseur 
    @fournisseur.destroy
    respond_to do |format|
      format.html { redirect_to fournisseurs_url, notice: 'Fournisseur was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fournisseur
      @fournisseur = Fournisseur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fournisseur_params
      params.require(:fournisseur).permit(:nom, :telephone, :fax, :adresse_ligne1, :adresse_ligne2, :code_postal, :ville)
    end
end
