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

class Fournisseur < ActiveRecord::Base

	before_save :pretty_name
	validates :nom, presence: true, uniqueness: true	

	has_many :users, as: :entreprise, dependent: :delete_all
	has_many :markets, dependent: :delete_all

	def pretty_name
		self.nom=nom.mb_chars.upcase.to_s if self.nom
	end

	def consultations
		markets.inject([]) do |consults, market|
			consults << market.consultation
			consults
		end
	end

end
