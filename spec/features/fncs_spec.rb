feature 'Fnc', :devise do
	before(:all) do
		@consultation =  create(:consultation)
		@etb1 = @consultation.etablissements.first
		@user_etb=@etb1.users.first

		@fournisseur = @consultation.markets.first.fournisseur
		@marche=@consultation.markets.first
		@user_fourn=@fournisseur.users.first
	end

	# Un établissement peut créer une fnc sur ses consultations

	scenario 'User Etablissement can create' do
		visit root_path
		signin(@user_etb.email, @user_etb.password)
		visit consultations_path
		click_link("FNC", match: :first)
		expect(page).to have_content "Fiche de non conformité"

		# via l'url
		visit new_marche_fnc_path(@marche)
		expect(page).to have_content "Fiche de non conformité"

		# Remplissage
		
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
		expect(page).to have_content "succès."
	end

	# Un fournisseur ne peut pas créer de fnc sur les consultations ou il a un marché

	scenario 'User Fournisseur cannot create' do
		visit root_path
		signin(@user_fourn.email, @user_fourn.password)
		visit consultations_path
		expect(page).not_to have_content 'FNC'

		# via l'url
		visit new_marche_fnc_path(@marche)
		expect(page).to have_content "Accès interdit."
	end

	# Un fournisseur peut répondre à une fnc et si son statut est ouvert

	# Un établissement peut répondre à une fnc et si sont statut est ouver

	# Un établissement peut cloturer une fnc (et changer par conséquent son statut)

	# Un fournisseur ne peut pas cloturer une fnc

end
