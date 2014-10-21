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
		ignore do
			nbr_users 2
		end
		after(:create) do |etablissement, evaluator|
			etablissement.users = create_list(:user, evaluator.nbr_users, :etablissement)			
		end
	end
end
