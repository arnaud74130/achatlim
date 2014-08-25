class ConsultationsController < ApplicationController
	before_action :set_entreprise

	def index		
		@consultations = current_user.entreprise.consultations
	end

	private

	def set_entreprise
		@entreprise = current_user.entreprise
	end
end
