
# Définition du nombre d'établissements et de marchés associés
# consultation=FactoryGirl.create(:consultation, nbr_etablissements: 3, nbr_marches: 2)
#
# par défaut, 5 établissements et 4 marchés
# consultation=FactoryGirl.create(:consultation)
FactoryGirl.define do
	factory :consultation do
		code {Faker::Code.ean}
		libelle {Faker::Lorem.sentence}
		debut {Date.today-rand(2500)}
		fin {Date.today+rand(2500)}
		ignore do
			nbr_etablissements 5
			nbr_marches 4
		end
		after(:create) do |consultation, evaluator|
			consultation.etablissements = create_list(:etablissement, evaluator.nbr_etablissements)
			consultation.markets = create_list(:market, evaluator.nbr_marches)
		end
	end
end
