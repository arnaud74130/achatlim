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


# voir établissement pour l'utilisation

FactoryGirl.define do
	factory :fournisseur do |f|
		f.nom {Faker::Company.name}
		f.telephone { Faker::PhoneNumber.phone_number }
		f.fax { Faker::PhoneNumber.phone_number }
		f.adresse_ligne1 {Faker::Address.street_address}
		f.code_postal {Faker::Address.zip_code}
		f.ville {Faker::Address.city}
		transient do
			nbr_users 1
		end
		after(:create) do |fournisseur, evaluator|
			fournisseur.users = create_list(:user, evaluator.nbr_users, :fournisseur)
		end

	end
end
