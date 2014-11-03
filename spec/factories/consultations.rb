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

# Définition du nombre d'établissements et de marchés associés
# consultation=FactoryGirl.create(:consultation, nbr_etablissements: 3, nbr_marches: 2)
#
# par défaut, 5 établissements et 4 marchés
# consultation=FactoryGirl.create(:consultation)
FactoryGirl.define do
	factory :consultation do |c|
		c.code {Faker::Code.ean}
		c.libelle {Faker::Lorem.sentence}
		c.debut {Date.today-rand(2500)}
		c.fin {Date.today+rand(2500)}
		ignore do
			nbr_etablissements 5
			nbr_marches 4
		end
		after(:create) do |consultation, evaluator|
			consultation.etablissements = create_list(:etablissement, evaluator.nbr_etablissements)
			consultation.markets = create_list(:market, evaluator.nbr_marches)
			consultation.user = consultation.etablissements.first.users.first
			consultation.markets.each do |marche|
				2.times do
					fnc = create(:fnc)
					marche.fncs << fnc
					observation_etb = create(:observation)
					observation_fourn = create(:observation)
					observation_etb.user = consultation.etablissements.first.users.first
					observation_fourn.user = marche.fournisseur.users.first
					fnc.observations << observation_etb
					fnc.observations << observation_fourn	
					fnc.etablissement = consultation.etablissements.first
					fnc.save			
				end
				consultation.save
			end
		end
	end
end
