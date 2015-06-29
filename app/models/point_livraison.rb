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

class PointLivraison < ActiveRecord::Base
  belongs_to :etablissement
  has_many :horaire_livraisons
  has_and_belongs_to_many :caracteristique_livraisons, uniq: true
  has_and_belongs_to_many :famille_segments, uniq: true

  accepts_nested_attributes_for :horaire_livraisons, allow_destroy: true

end
