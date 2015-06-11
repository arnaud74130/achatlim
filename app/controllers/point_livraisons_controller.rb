class PointLivraisonsController < ApplicationController
  before_action :set_etablissement, :set_famille_segments
  before_action :set_point_livraison, only: [:show, :edit, :update, :destroy]

  # GET /point_livraisons
  # GET /point_livraisons.json
  def index
    @point_livraisons = @etablissement.point_livraisons
  end

  # GET /point_livraisons/1
  # GET /point_livraisons/1.json
  def show
    @point_livraison = @etablissement.point_livraisons.find(params[:id])
  end

  # GET /point_livraisons/new
  def new
    @point_livraison = @etablissement.point_livraisons.build
    @point_livraison.horaire_livraisons.first_or_initialize
  end

  # GET /point_livraisons/1/edit
  def edit
  end

  # POST /point_livraisons
  # POST /point_livraisons.json
  def create
    @point_livraison = @etablissement.point_livraisons.new(point_livraison_params)

    respond_to do |format|
      if @point_livraison.save
        format.html { redirect_to [@etablissement, @point_livraison], notice: 'Point livraison was successfully created.' }        
      else
        format.html { render :new }        
      end
    end
  end

  # PATCH/PUT /point_livraisons/1
  # PATCH/PUT /point_livraisons/1.json
  def update
    respond_to do |format|
      if @point_livraison.update(point_livraison_params)
        format.html { redirect_to [@etablissement, @point_livraison], notice: 'Point livraison was successfully updated.' }        
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /point_livraisons/1
  # DELETE /point_livraisons/1.json
  def destroy
    @point_livraison.destroy
    respond_to do |format|
      format.html { redirect_to point_livraisons_url, notice: 'Point livraison was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_etablissement
    @etablissement = Etablissement.find(params[:etablissement_id])
  end
  def set_famille_segments
    @famille_segments=FamilleSegment.all
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_point_livraison
      @point_livraison = PointLivraison.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_livraison_params
      params.require(:point_livraison).permit(:adresse_ligne1, :adresse_ligne2, :adresse_cp, :adresse_ville, :adresse_commentaire, :is_principal, :etablissement_id, :famille_segment_ids => [], :horaire_livraisons_attributes => [:id, :jour, :debut, :fin])
    end
end
