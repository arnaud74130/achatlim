class FncsController < ApplicationController
  before_action :set_fnc, only: [:show, :edit, :update, :destroy]

  # GET /fncs
  # GET /fncs.json
  def index
    @fncs = Fnc.all
  end

  # GET /fncs/1
  # GET /fncs/1.json
  def show
  end

  # GET /fncs/new
  def new
    @fnc = Fnc.new
  end

  # GET /fncs/1/edit
  def edit
  end

  # POST /fncs
  # POST /fncs.json
  def create
    @fnc = Fnc.new(fnc_params)

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

  # PATCH/PUT /fncs/1
  # PATCH/PUT /fncs/1.json
  def update
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

  # DELETE /fncs/1
  # DELETE /fncs/1.json
  def destroy
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
      params.require(:fnc).permit(:date_creation, :raison_litige, :numero_commande, :produits, :commande_passee, :livraison_demandee, :lot_ou_dlc, :observation_id, :instruction_avoir, :instruction_facture, :instruction_surv_prepa, :instruction_reprendre, :instruction_relivrer, :instruction_autre, :market_id, :respect_delais, :proprete_camion, :etat_emballage, :conformite_produit, :respect_dlc, :temperature_produit, :abs_tracabilite, :tarification,:observations_attributes => [:id, :etablissement, :fournisseur, :_destroy])
    end
end
