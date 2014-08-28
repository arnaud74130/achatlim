class ConsultationsController < ApplicationController
	before_filter :authenticate_user!
	

	before_action :set_entreprises
	before_action :set_consultation, only: [:show, :edit, :update, :destroy]
	
	after_action :verify_authorized

	def index
		@consultations = current_user.entreprise.consultations
		authorize Consultation
	end

	def new
		authorize Consultation
		@consultation = current_user.entreprise.consultations.build
		@consultation.markets.first_or_initialize				
	end

	def create		
		@consultation = Consultation.new(consultation_params)
		authorize @consultation
		respond_to do |format|
			if @consultation.save
				format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def show		
		authorize @consultation
	end

	def edit			
		authorize @consultation
	end

	def update
		authorize @consultation
		respond_to do |format|
			if @consultation.update(consultation_params)
				format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		authorize @consultation
		@consultation.destroy
		respond_to do |format|
			format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_consultation
		#@consultation = current_user.entreprise.consultations.find(params[:id]) #FIXME, find not working with returned array instead of active relation grrr....
		@consultation = Consultation.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def consultation_params
		params.require(:consultation).permit(:code, :libelle, :debut, :fin,:etablissement_ids => [], :markets_attributes => [:id, :code, :fournisseur_id, :_destroy])
	end


	def set_entreprises
		@entreprise = current_user.entreprise
		@etablissements= Etablissement.all
	end
end
