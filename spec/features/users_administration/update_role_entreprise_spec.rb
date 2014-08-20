feature 'Update Role Entreprise', :devise do
	scenario 'GRC can update role' do
		eric = create :user, :admin
		other = create :user
		signin(eric.email, eric.password)
		visit users_path
		select "Fournisseur", from: "select_entreprise_#{other.id}"
		click_button "submit_btn_user_#{eric.id}"
		#expect(other.role).to be("fournisseur")		
		expect(page).to have_content 'User updated.'	
	end
end
