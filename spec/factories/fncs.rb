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
    #market
    #observations nil
  end
end
