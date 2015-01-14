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

feature 'Fournisseur', :devise do
	before(:all) do
		@eric = create :user, :admin
	end
	scenario 'L Admin peut creer un fournisseur' do
		visit root_path
		signin(@eric.email, @eric.password)
		visit fournisseurs_path
		expect(page).to have_content 'Fournisseurs'
		click_link 'Nouveau'
		expect(page).to have_content "Création d'un nouveau Fournisseur"
		fill_in 'Nom', :with => 'EPSILIM'
		fill_in 'Telephone', :with => '05.44.00.00.44'
		click_button 'Créer un Fournisseur'
		expect(page).to have_content 'Le fournisseur a été créé avec succès.'
	end
end