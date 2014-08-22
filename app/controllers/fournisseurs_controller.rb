class FournisseursController < ApplicationController
  before_action :set_fournisseur, only: [:show, :edit, :update, :destroy]

  def index
    @fournisseurs = Fournisseur.all
  end

  def show
  end

  def new
    @fournisseur = Fournisseur.new
  end

  def edit
  end

  def create
    @fournisseur = Fournisseur.new(fournisseur_params)

    respond_to do |format|
      if @fournisseur.save
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @fournisseur.update(fournisseur_params)
        format.html { redirect_to @fournisseur, notice: 'Fournisseur was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
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
