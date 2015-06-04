class CaracteristiqueLivraisonsController < ApplicationController
  before_action :set_caracteristique_livraison, only: [:show, :edit, :update, :destroy]

  # GET /caracteristique_livraisons
  # GET /caracteristique_livraisons.json
  def index
    @caracteristique_livraisons = CaracteristiqueLivraison.all
  end

  # GET /caracteristique_livraisons/1
  # GET /caracteristique_livraisons/1.json
  def show
  end

  # GET /caracteristique_livraisons/new
  def new
    @caracteristique_livraison = CaracteristiqueLivraison.new
  end

  # GET /caracteristique_livraisons/1/edit
  def edit
  end

  # POST /caracteristique_livraisons
  # POST /caracteristique_livraisons.json
  def create
    @caracteristique_livraison = CaracteristiqueLivraison.new(caracteristique_livraison_params)

    respond_to do |format|
      if @caracteristique_livraison.save
        format.html { redirect_to @caracteristique_livraison, notice: 'Caracteristique livraison was successfully created.' }
        format.json { render :show, status: :created, location: @caracteristique_livraison }
      else
        format.html { render :new }
        format.json { render json: @caracteristique_livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracteristique_livraisons/1
  # PATCH/PUT /caracteristique_livraisons/1.json
  def update
    respond_to do |format|
      if @caracteristique_livraison.update(caracteristique_livraison_params)
        format.html { redirect_to @caracteristique_livraison, notice: 'Caracteristique livraison was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracteristique_livraison }
      else
        format.html { render :edit }
        format.json { render json: @caracteristique_livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristique_livraisons/1
  # DELETE /caracteristique_livraisons/1.json
  def destroy
    @caracteristique_livraison.destroy
    respond_to do |format|
      format.html { redirect_to caracteristique_livraisons_url, notice: 'Caracteristique livraison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracteristique_livraison
      @caracteristique_livraison = CaracteristiqueLivraison.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracteristique_livraison_params
      params.require(:caracteristique_livraison).permit(:libelle)
    end
end
