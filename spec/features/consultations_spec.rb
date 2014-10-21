feature 'Consultation', :devise do
	before(:all) do
		@consultation =  create(:consultation)
		@eric = @consultation.etablissements.first.users.first # c'est le créateur
		@etb1 = @consultation.etablissements.first
		@etb2 = @consultation.etablissements.last
		@fournisseur1 = @consultation.markets.first.fournisseur
		@fournisseur2 = @consultation.markets.last.fournisseur
	end

	# Un établissement peut créer une consultation
	scenario 'Un utilisateur d un etablissement peut creer' do
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

	# Un fournisseur ne peut pas créer de consultation
	scenario 'Un utilisateur fournisseur ne peut pas creer' do
		visit root_path
		signin(@fournisseur1.users.first.email, @fournisseur1.users.first.password)
		visit consultations_path
		expect(page).to have_content 'Consultations'
		expect(page).not_to have_content 'Nouveau'
	end

	# Seul l'utilisateur créateur de la consultation peut la modifier !
	scenario 'Le createur peut modifier' do
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

		# check via l'URL
		visit edit_consultation_path(@consultation)
		expect(page).to have_content 'Edition'	

	end

	# Un utilisateur d'un établissement ne peut pas modifier la consultation
	scenario 'Un utilisateur d un autre etablissement ne peut pas modifier' do
		visit root_path
		signin(@etb2.users.last.email, @etb2.users.last.password)
		visit consultations_path
		click_link "#{@consultation.code}"
		expect(page).to have_content "Liste des informations associées."	
		expect(page).not_to have_content 'Modifier'	
		
		# check via l'URL
		visit edit_consultation_path(@consultation)
		expect(page).to have_content 'Accès interdit.'	
	end

	# Un utilisateur de l'établissement créateur ne peut pas modifier
	scenario 'Un utilisateur (hors createur) de l etablissement createur ne peut pas modifier' do
		visit root_path
		christine = @consultation.etablissements.first.users.last
		signin(christine.email, christine.password)
		visit consultations_path
		click_link "#{@consultation.code}"
		expect(page).to have_content "Liste des informations associées."	
		expect(page).not_to have_content 'Modifier'	
		
		# check via l'URL
		visit edit_consultation_path(@consultation)
		expect(page).to have_content 'Accès interdit.'	
	end


end
