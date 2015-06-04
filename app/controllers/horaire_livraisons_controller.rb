class HoraireLivraisonsController < ApplicationController
  before_action :set_horaire_livraison, only: [:show, :edit, :update, :destroy]

  # GET /horaire_livraisons
  # GET /horaire_livraisons.json
  def index
    @horaire_livraisons = HoraireLivraison.all
  end

  # GET /horaire_livraisons/1
  # GET /horaire_livraisons/1.json
  def show
  end

  # GET /horaire_livraisons/new
  def new
    @horaire_livraison = HoraireLivraison.new
  end

  # GET /horaire_livraisons/1/edit
  def edit
  end

  # POST /horaire_livraisons
  # POST /horaire_livraisons.json
  def create
    @horaire_livraison = HoraireLivraison.new(horaire_livraison_params)

    respond_to do |format|
      if @horaire_livraison.save
        format.html { redirect_to @horaire_livraison, notice: 'Horaire livraison was successfully created.' }
        format.json { render :show, status: :created, location: @horaire_livraison }
      else
        format.html { render :new }
        format.json { render json: @horaire_livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horaire_livraisons/1
  # PATCH/PUT /horaire_livraisons/1.json
  def update
    respond_to do |format|
      if @horaire_livraison.update(horaire_livraison_params)
        format.html { redirect_to @horaire_livraison, notice: 'Horaire livraison was successfully updated.' }
        format.json { render :show, status: :ok, location: @horaire_livraison }
      else
        format.html { render :edit }
        format.json { render json: @horaire_livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horaire_livraisons/1
  # DELETE /horaire_livraisons/1.json
  def destroy
    @horaire_livraison.destroy
    respond_to do |format|
      format.html { redirect_to horaire_livraisons_url, notice: 'Horaire livraison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horaire_livraison
      @horaire_livraison = HoraireLivraison.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horaire_livraison_params
      params.require(:horaire_livraison).permit(:jour, :debut, :fin)
    end
end
