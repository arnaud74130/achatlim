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

FactoryGirl.define do
  factory :horaire_livraison do |h|
    h.sequence(:jour) {|j| ["Lundi","Mardi","Mercredi", "Jeudi", "Vendredi"][(j-1) % 5]}
	#h.jour {Faker::Name.jours}
	h.debut {Faker::Name.heures.to_s+":"+Faker::Name.minutes.to_s}
	h.fin {Faker::Name.heures.to_s+":"+Faker::Name.minutes.to_s}
  end

end
