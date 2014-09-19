
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
				end
				consultation.save
			end
		end
	end
end
