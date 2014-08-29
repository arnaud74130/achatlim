feature 'Consultation', :devise do
	before(:all) do
		@consultation =  create(:consultation)
		@eric = @consultation.etablissements.first.users.first
		@etb1 = @consultation.etablissements.first
		@etb2 = @consultation.etablissements.last
		@fournisseur1 = @consultation.markets.first.fournisseur
		@fournisseur2 = @consultation.markets.last.fournisseur
	end

	scenario 'Etablissement can create' do
		visit root_path
		signin(@eric.email, @eric.password)
		visit consultations_path
		expect(page).to have_content 'Consultations'
		click_link 'Nouveau'
		expect(page).to have_content "Ajout d'une consultation"
		fill_in 'Code', :with => 'AZ12'
		check "#{@etb1.nom}"
		check "#{@etb2.nom}"
		fill_in 'consultation[markets_attributes][0][code]', with: "M1"
		fill_in 'consultation[markets_attributes][0][fournisseur_nom]', with: "#{@fournisseur1.nom}"
		click_button 'Créer'
		expect(page).to have_content 'La consultation a été créé avec succès.'
	end

	scenario 'Fournisseur cannot create' do
		visit root_path
		signin(@fournisseur1.users.first.email, @fournisseur1.users.first.password)
		visit consultations_path
		expect(page).to have_content 'Consultations'
		expect(page).not_to have_content 'Nouveau'
	end

	scenario 'Etablissement can update' do
		visit root_path
		signin(@eric.email, @eric.password)
		visit consultations_path
		click_link "#{@consultation.code}"
		expect(page).to have_content "Liste des informations associées."	
		click_link "Modifier"
		expect(page).to have_content "Edition"	
		uncheck "#{@etb2.nom}"
		click_button 'Modifier'
		expect(page).to have_content 'Consultation was successfully updated'
	end
end
