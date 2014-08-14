class EtablissementsController < ApplicationController
  before_action :set_etablissement, only: [:show, :edit, :update, :destroy]

  # GET /etablissements
  # GET /etablissements.json
  def index
    @etablissements = Etablissement.all
  end

  # GET /etablissements/1
  # GET /etablissements/1.json
  def show
  end

  # GET /etablissements/new
  def new
    @etablissement = Etablissement.new
  end

  # GET /etablissements/1/edit
  def edit
  end

  # POST /etablissements
  # POST /etablissements.json
  def create
    @etablissement = Etablissement.new(etablissement_params)

    respond_to do |format|
      if @etablissement.save
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully created.' }
        format.json { render :show, status: :created, location: @etablissement }
      else
        format.html { render :new }
        format.json { render json: @etablissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etablissements/1
  # PATCH/PUT /etablissements/1.json
  def update
    respond_to do |format|
      if @etablissement.update(etablissement_params)
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully updated.' }
        format.json { render :show, status: :ok, location: @etablissement }
      else
        format.html { render :edit }
        format.json { render json: @etablissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etablissements/1
  # DELETE /etablissements/1.json
  def destroy
    @etablissement.destroy
    respond_to do |format|
      format.html { redirect_to etablissements_url, notice: 'Etablissement was successfully destroyed.' }
      format.json { head :no_content }
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
