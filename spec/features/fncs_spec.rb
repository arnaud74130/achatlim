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

	scenario 'Un etablissement peut créer' do
		visit root_path
		signin(@user_etb.email, @user_etb.password)
		visit consultations_path
		click_link("FNC", match: :first)
		expect(page).to have_content "Fiche de non conformité"

		# via l'url
		visit new_market_fnc_path(@marche)
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

	scenario 'Un fournisseur ne peut pas créer' do
		visit root_path
		signin(@user_fourn.email, @user_fourn.password)
		visit consultations_path
		expect(page).not_to have_content 'FNC'

		# via l'url
		visit new_market_fnc_path(@marche)
		expect(page).to have_content "Accès interdit."
	end

	# Un fournisseur peut répondre à une fnc et si son statut est ouvert
	scenario 'Un fournisseur peut répondre sauf si la fiche est cloturée' do
		visit root_path
		signin(@user_fourn.email, @user_fourn.password)
		reponse_si_non_cloturee
	end

	# Un établissement peut répondre à une fnc et si sont statut est ouver
	scenario 'Un etablissement peut répondre sauf si la fiche est cloturée' do
		visit root_path
		signin(@user_etb.email, @user_etb.password)
		reponse_si_non_cloturee
	end


	# scenario "Un utilisateur de l'établissement créateur peut cloturer" do
	# scenario "Un utilisateur de l'établissement non créateur ne peut pas cloturer" do

	# scenario "Un fournisseur ne peut pas cloturer une fnc" do

	private
	def reponse_si_non_cloturee
		visit fncs_path
		fnc_id=first(:xpath, "//tr/td/a").text
		fnc=Fnc.find(fnc_id)
		all(:xpath, "//tr/td/a")[0].click #1er lien

		
		expect(page).to have_content "Répondre"

		# entrer une réponse
		visit edit_fnc_path(fnc)
		fill_in "Message", with: "Une réponse"
		click_button 'Enregistrer'
		expect(page).to have_content "La fiche de non confirmité a été modifié avec succès."


		# --- Cloture de la fiche ---

		fnc.cloturee=true
		fnc.save

		visit fncs_path
		find(:xpath, "//tr/td/a[@href='/fncs/#{fnc_id}']").click
		expect(page).not_to have_content 'Répondre'
	end
end
