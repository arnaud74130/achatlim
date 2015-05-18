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
	let(:eric) {consultation.etablissements.first.users.first}
	let(:fournisseur) {consultation.markets.first.fournisseur}
	let(:fnc) {create(:fnc)}
	before do
		visit root_path
		login_as(eric)	
	end
	scenario "Fournisseur recoit automatiquement un email lors de l'ajout d'une FNC" do
		market =  consultation.markets.first		
		market.fncs << fnc
		email = find_email!(fournisseur.users.first.email)		
		expected_subject = "[ACHATLIM] Création d'une FNC sur le marché #{market.code}"
		click_first_link_in_email(email)
		expect(current_path).to eq market_fnc_path(fnc)
	end
end