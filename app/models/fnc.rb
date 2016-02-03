#     AchatLim - Plateforme Collaborative Achat du Limousin
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#                         
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

class Fnc < ActiveRecord::Base
	default_scope { order(:cloturee).order(:created_at)}
	scope :ouvertes, ->{ where(cloturee: false).order(:created_at) }
	scope :fermees, ->{ where(cloturee: true).order(:created_at) }

	has_many :observations
	# TODO -----> PHOTO has_many :photos
	belongs_to :market
	has_one :consultation, through: :market
	has_one :fournisseur, through: :market
	belongs_to :etablissement

	validates :raison_litige, :numero_commande,
		:produits, :commande_passee, :livraison_demandee, :lot_ou_dlc, presence: true

	accepts_nested_attributes_for :observations, allow_destroy: true
	# TODO ----->	accepts_nested_attributes_for :photos, allow_destroy: true



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
