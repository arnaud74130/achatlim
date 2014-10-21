# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fnc do
   created_at {Date.today-rand(2500)}
    raison_litige {Faker::Lorem.sentence}
    numero_commande {Faker::Number.number(8)}
    produits {Faker::Commerce.product_name}
    commande_passee {Date.today+rand(500)}
    livraison_demandee {Date.today+rand(1000)}
    lot_ou_dlc {Faker::Code.ean}
    instruction_avoir {[false,true].sample}
    instruction_facture {[false,true].sample}
    instruction_surv_prepa {[false,true].sample}
    instruction_reprendre {[false,true].sample}
    instruction_relivrer {[false,true].sample}
    instruction_autre {Faker::Lorem.sentence}
    respect_delais {["A","B","C"].sample}
    proprete_camion {["A","B","C"].sample}
    etat_emballage {["A","B","C"].sample}
    conformite_produit {["A","B","C"].sample}
    respect_dlc {["A","B","C"].sample}
    temperature_produit {["A","B","C"].sample}
    abs_tracabilite {["A","B","C"].sample}
    tarification {["A","B","C"].sample}
    etat {false}
    #market
    #observations nil
  end
end
