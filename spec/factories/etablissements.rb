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


# Création de 3 utilisateurs associés
# etablissement=FactoryGirl.create(:etablissement, nbr_users: 3)
# par défaut, 1 utilisateur
# passer 0 pour ne pas avoir d'utilisateur : FactoryGirl.create(:etablissement, nbr_users: 0)
FactoryGirl.define do
	factory :etablissement do |e|
		e.nom {Faker::Company.name}
		e.code_adherent {Faker::Company.duns_number}
		e.telephone { Faker::PhoneNumber.phone_number }
		e.fax { Faker::PhoneNumber.phone_number }
		e.adresse_ligne1 {Faker::Address.street_address}
		e.code_postal {Faker::Address.zip_code}
		e.ville {Faker::Address.city}
		e.is_coordonnateur false
		transient do
			nbr_users 2
		end
		after(:create) do |etablissement, evaluator|
			etablissement.users = create_list(:user, evaluator.nbr_users, :etablissement)			
			etablissement.point_livraisons << create(:point_livraison, :principal)
			etablissement.point_livraisons << create(:point_livraison)			
		end
	end
end
