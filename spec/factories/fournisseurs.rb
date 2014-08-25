# voir établissement pour l'utilisation

FactoryGirl.define do
	factory :fournisseur do |f|
		f.nom {Faker::Company.name}
		f.telephone { Faker::PhoneNumber.phone_number }
		f.fax { Faker::PhoneNumber.phone_number }
		f.adresse_ligne1 {Faker::Address.street_address}
		f.code_postal {Faker::Address.zip_code}
		f.ville {Faker::Address.city}
		ignore do
			nbr_users 1
		end
		after(:create) do |fournisseur, evaluator|
			fournisseur.users = create_list(:user, evaluator.nbr_users, :fournisseur)
		end

	end
end
