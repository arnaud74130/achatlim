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

class Market < ActiveRecord::Base
	belongs_to :fournisseur
	belongs_to :consultation
	has_many :fncs

	scope :fnc_ouvertes,  -> {includes(:fncs).where(fncs: {cloturee: false})} 
	scope :fnc_fermees,  -> {includes(:fncs).where(fncs: {cloturee: true})} 

	validates :code, presence: true
	validates :fournisseur, presence: true


	accepts_nested_attributes_for :fournisseur

	def fournisseur_nom
		self.fournisseur.nom if fournisseur
	end
end
