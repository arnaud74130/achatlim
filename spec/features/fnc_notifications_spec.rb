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

require "rails_helper"

RSpec.feature "FNC Emails :" do
	let(:consultation) {create(:consultation)}
	let(:marche) {consultation.markets.first}
	let(:eric) {consultation.etablissements.first.users.first}
	let(:fournisseur) {consultation.markets.first.fournisseur}
	before do
		visit root_path
		
	end
	scenario "Fournisseur recoit automatiquement un email lors de l'ajout d'une FNC" do		
		login_as(eric)	
		visit new_market_fnc_path(marche)
		expect(page).to have_content "Fiche de non conformité"

		fill_in 'fnc[raison_litige]', :with => 'Un litige'
		fill_in 'fnc[numero_commande]', :with => '1234'
		fill_in 'fnc[produits]', :with => 'Produit'
		fill_in 'fnc[commande_passee]', :with => '12/05/2014'
		fill_in 'fnc[livraison_demandee]', :with => '22/06/2014'
		fill_in 'fnc[lot_ou_dlc]', :with => '1234'
		check 'fnc[instruction_avoir]'
		check 'fnc[instruction_facture]'
		check 'fnc[instruction_surv_prepa]'
		check 'fnc[instruction_reprendre]'
		check 'fnc[instruction_relivrer]'

		select 'A', from: 'fnc[respect_delais]'

		find('input[type="submit"]').click



		email = find_email!(fournisseur.users.first.email)		
		expected_subject = "[ACHATLIM] #{eric.entreprise.nom} vient de déclarer une fiche de non conformité"
		#click_first_link_in_email(email)
		#expect(current_path).to eq edit_fnc_path(fnc)
	end
	
	scenario "Etablissement ajoute une observation" do
		login_as(eric)	
		fnc = marche.fncs.first
		visit edit_fnc_path(fnc)
		fill_in "Message", with: "Complément d'information"
		click_button 'Enregistrer'
		email = find_email!(fournisseur.users.first.email)		
		expected_subject = "[ACHATLIM] #{eric.entreprise.nom} vient de répondre à la non conformité ..."		
	end

	scenario "Fournisseur répond" do
		login_as(fournisseur.users.first)	
		fnc = marche.fncs.first
		visit edit_fnc_path(fnc)
		fill_in "Message", with: "Réponse fournisseur"
		click_button 'Enregistrer'
		email = find_email!(eric.email)		
		expected_subject = "[ACHATLIM] #{fournisseur.nom} vient de répondre à la non conformité ..."		
	end

end