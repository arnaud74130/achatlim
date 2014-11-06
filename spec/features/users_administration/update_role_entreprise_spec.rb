feature "Mise à jour des roles", :devise do
	before(:all) do
		@eric = create :user, :admin
		@visiteur = create :user
		@consultation =  create(:consultation)
		@user_etb = @consultation.etablissements.first.users.first
		@user_fournisseur = @consultation.markets.first.fournisseur.users.first
	end
	scenario "L'Admin peut mettre à jour les roles" do
		signin(@eric.email, @eric.password)
		visit users_path
		select "Fournisseur", from: "select_entreprise_#{@visiteur.id}"
		click_button "submit_btn_user_#{@eric.id}"
		expect(page).to have_content 'User updated.'
	end

	scenario "Un utilisateur (Etablissement) ne peut pas accéder aux utilisateurs" do
		visit root_path
		signin(@user_etb.email, @user_etb.password)
		visit users_path
		expect(page).to have_content 'Accès interdit.'			
	end

	scenario "Un utilisateur (Fournisseur) ne peut pas accéder aux utilisateurs" do
		visit root_path
		signin(@user_fournisseur.email, @user_fournisseur.password)
		visit users_path
		expect(page).to have_content 'Accès interdit.'			
	end

	scenario " Contrôle d'intégrité entre l'entreprise [Fournisseur] et le role [Etablissement]" do
		signin(@eric.email, @eric.password)
		visit users_path

		#select "Etablissement", from: "select_entreprise_#{@visiteur.id}"	
		#find(:xpath, "//input[@id='user_entreprise_nom']")[0].set @user_fournisseur.entreprise.nom
		#first(:xpath,"//input[@name='user[entreprise_id]']").set @user_fournisseur.entreprise.id
		#first(:xpath,"//input[@name='user[entreprise_type]']").set "Fournisseur"
		# utiliser find avec match first etc.. à voir				
		#click_button "submit_btn_user_#{@visiteur.id}"			
		#save_and_open_page
		#print page.html
				
		within find(:xpath, "//form[@id='edit_user_#{@visiteur.id}']") do			
			select "Etablissement"			
			fill_in "user_entreprise_nom", with: @user_fournisseur.entreprise.nom
			find("input[name='user[entreprise_id]']").set @user_fournisseur.entreprise.id
			find("input[name='user[entreprise_type]']").set "Fournisseur"			
			click_button 'Change Role'
		end						
		expect(page).to have_content "Attention le rôle et l'entreprise sont incohérents."		
	end

	scenario " Contrôle d'intégrité entre l'entreprise [Etablissement] et le role [Fournisseur]" do
		signin(@eric.email, @eric.password)
		visit users_path		
		within find(:xpath, "//form[@id='edit_user_#{@visiteur.id}']") do			
			select "Fournisseur"			
			fill_in "user_entreprise_nom", with: @user_etb.entreprise.nom
			find("input[name='user[entreprise_id]']").set @user_etb.entreprise.id
			find("input[name='user[entreprise_type]']").set "Etablissement"			
			click_button 'Change Role'
		end						
		expect(page).to have_content "Attention le rôle et l'entreprise sont incohérents."		
	end

end
