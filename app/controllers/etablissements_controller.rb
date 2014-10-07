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

class EtablissementsController < ApplicationController
  before_action :set_etablissement, only: [:show, :edit, :update, :destroy]
  def index
    @etablissements = Etablissement.all
  end

  def show
  end

  # GET /etablissements/new
  def new
    @etablissement = Etablissement.new
  end

  # GET /etablissements/1/edit
  def edit
  end

  def create
    @etablissement = Etablissement.new(etablissement_params)

    respond_to do |format|
      if @etablissement.save
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully created.' }        
      else
        format.html { render :new }     
      end
    end
  end
  def update
    respond_to do |format|
      if @etablissement.update(etablissement_params)
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @etablissement.destroy
    respond_to do |format|
      format.html { redirect_to etablissements_url, notice: 'Etablissement was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etablissement
      @etablissement = Etablissement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etablissement_params
      params.require(:etablissement).permit(:nom, :code_adherent, :telephone, :fax, :adresse_ligne1, :adresse_ligne2, :code_postal, :ville)
    end
end
