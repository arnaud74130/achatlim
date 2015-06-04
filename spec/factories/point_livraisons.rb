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
  factory :point_livraison do
    adresse_ligne1 {Faker::Address.street_address}
	adresse_ligne2 ""
	adresse_cp {Faker::Address.zip_code}
	adresse_ville {Faker::Address.city}
	adresse_commentaire {Faker::Lorem.sentence}
	trait :principal do # create :point_livraison, :principal
        is_principal true
    end
    after(:create) do |point_livraison, evaluator|
		point_livraison.horaire_livraisons = create_list(:horaire_livraison, 5)
		point_livraison.caracteristique_livraisons = create_list(:caracteristique_livraison, 4)		
		point_livraison.famille_segments << FamilleSegment.first
		point_livraison.famille_segments << FamilleSegment.last
		point_livraison.famille_segments << FamilleSegment.where(libelle: "Céréales").first		
	end
  end
end
