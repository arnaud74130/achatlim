class Fnc < ActiveRecord::Base
	default_scope { order(:etat).order(:created_at)}
	scope :ouvertes, ->{ where(etat: true).order(:created_at) }
	scope :fermees, ->{ where(etat: false).order(:created_at) }

	has_many :observations
	belongs_to :market
	has_one :consultation, through: :market
	has_one :fournisseur, through: :market

	accepts_nested_attributes_for :observations, allow_destroy: true


	def self.fiches_pour_etablissement(etb, code="Ouvertes" )
		fiches = Fnc.joins(consultation: :etablissements).where(etablissements: {id: etb.id})
		case code
		when "Ouvertes"
			return fiches.ouvertes
		when "Fermees"
			return fiches.fermees
		else
			fiches
		end
	end

	def self.fiches_pour_fournisseur(fourn, code="Ouvertes" )
		fiches = Fnc.joins(:market).where(markets: {fournisseur_id: fourn.id})
		case code
		when "Ouvertes"
			return fiches.ouvertes
		when "Fermees"
			return fiches.fermees
		else
			fiches
		end
	end

end
