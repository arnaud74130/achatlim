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

class Etablissement < ActiveRecord::Base

	scope :coordonnateur, ->{ where(is_coordonnateur: true).first }
	has_and_belongs_to_many :consultations
	has_many :users, as: :entreprise, dependent: :delete_all
	has_many :fncs
	has_many :point_livraisons
	validates :nom, :presence => true
	
	before_save :pretty_name
	before_destroy {|etablissement| etablissement.consultations.clear}
	def pretty_name
		self.nom=nom.mb_chars.upcase.to_s unless self.nom.blank?
	end

	#retourne le point de livraison principal
	def point_livraison_principal
		self.point_livraisons.where(is_principal: true).first	
	end
	
	# on passe:  collection.famille_segments et on retourne une hash, famille => point livraison
	def point_livraison_pour_segments(liste_famille)
		fs= self.famille_segments
		principal = self.point_livraison_principal
		res = {}
		liste_famille.each do |seg|			
			indic = fs.index(seg)
			if indic
				p = fs[indic]
				res[seg.libelle] = p.point_livraisons.first # il n'y a forcément qu'un seul point de livraison associé
			else
				res[seg.libelle]=principal			
			end
		end
		res
	end

	def famille_segments
		self.point_livraisons.inject([]) do |segs, pl|
			pl.famille_segments.each {|seg| segs << seg}
			segs
		end		
	end
end
