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
