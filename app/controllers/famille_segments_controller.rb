class FamilleSegmentsController < ApplicationController
  before_action :set_famille_segment, only: [:show, :edit, :update, :destroy]

  # GET /famille_segments
  # GET /famille_segments.json
  def index
    @famille_segments = FamilleSegment.all
  end

  # GET /famille_segments/1
  # GET /famille_segments/1.json
  def show
  end

  # GET /famille_segments/new
  def new
    @famille_segment = FamilleSegment.new
  end

  # GET /famille_segments/1/edit
  def edit
  end

  # POST /famille_segments
  # POST /famille_segments.json
  def create
    @famille_segment = FamilleSegment.new(famille_segment_params)

    respond_to do |format|
      if @famille_segment.save
        format.html { redirect_to @famille_segment, notice: 'Famille segment was successfully created.' }
        format.json { render :show, status: :created, location: @famille_segment }
      else
        format.html { render :new }
        format.json { render json: @famille_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /famille_segments/1
  # PATCH/PUT /famille_segments/1.json
  def update
    respond_to do |format|
      if @famille_segment.update(famille_segment_params)
        format.html { redirect_to @famille_segment, notice: 'Famille segment was successfully updated.' }
        format.json { render :show, status: :ok, location: @famille_segment }
      else
        format.html { render :edit }
        format.json { render json: @famille_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /famille_segments/1
  # DELETE /famille_segments/1.json
  def destroy
    @famille_segment.destroy
    respond_to do |format|
      format.html { redirect_to famille_segments_url, notice: 'Famille segment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_famille_segment
      @famille_segment = FamilleSegment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def famille_segment_params
      params.require(:famille_segment).permit(:libelle)
    end
end
