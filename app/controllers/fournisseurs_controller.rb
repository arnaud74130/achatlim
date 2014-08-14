class FournisseursController < ApplicationController
  before_action :set_fournisseur, only: [:show, :edit, :update, :destroy]

  # GET /fournisseurs
  # GET /fournisseurs.json
  def index
    @fournisseurs = Fournisseur.all
  end

  # GET /fournisseurs/1
  # GET /fournisseurs/1.json
  def show
  end

  # GET /fournisseurs/new
  def new
    @fournisseur = Fournisseur.new
  end

  # GET /fournisseurs/1/edit
  def edit
  end

  # POST /fournisseurs
  # POST /fournisseurs.json
  def create
    @fournisseur = Fournisseur.new(fournisseur_params)

    respond_to do |format|
      if @fournisseur.save
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully created.' }
        format.json { render :show, status: :created, location: @fournisseur }
      else
        format.html { render :new }
        format.json { render json: @fournisseur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fournisseurs/1
  # PATCH/PUT /fournisseurs/1.json
  def update
    respond_to do |format|
      if @fournisseur.update(fournisseur_params)
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully updated.' }
        format.json { render :show, status: :ok, location: @fournisseur }
      else
        format.html { render :edit }
        format.json { render json: @fournisseur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fournisseurs/1
  # DELETE /fournisseurs/1.json
  def destroy
    @fournisseur.destroy
    respond_to do |format|
      format.html { redirect_to fournisseurs_url, notice: 'Fournisseur was successfully destroyed.' }
      format.json { head :no_content }
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
