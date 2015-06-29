class AnnexesLogistiqueController < ApplicationController
  def index
  	@consultations = Consultation.where(en_cours: true)
  end
end
