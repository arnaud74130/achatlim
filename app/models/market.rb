class Market < ActiveRecord::Base
	belongs_to :fournisseur
	belongs_to :consultation
	validates :code, presence: true
	
	accepts_nested_attributes_for :fournisseur
	def fournisseur_nom
		self.fournisseur.nom if fournisseur
	end	
end
