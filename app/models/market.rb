class Market < ActiveRecord::Base
	belongs_to :fournisseur
	belongs_to :consultation
	validates :code, presence: true
	
	def entreprise_nom
		fournisseur.nom if fournisseur
	end

	def entreprise_id
		fournisseur.id if fournisseur
	end

	def entreprise_type
		"Fournisseur"
	end
end
