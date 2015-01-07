include Warden::Test::Helpers
Warden.test_mode!

feature 'User delete', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'un utilisateur peut desactiver son compte' do    
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    click_button 'Suppression'
    expect(page).to have_content 'Votre compte a été supprimé avec succès.'
  end

  scenario 'compte inactif' do
    user = FactoryGirl.create(:user)
    user.active = false
    user.save 
    signin(user.email, user.password)  
    expect(page).to have_content 'Votre compte est inactif !'
    visit consultations_path
    expect(page).to have_content 'Vous devez vous connecter pour continuer.'
  end

end


#  INTEGRATION DU NAVIGATEUR ET SIMULATION DU CLICK POUR LA POPUP JAVASCRIPT
# ajouter le :js dans les feature et le page.driver...

# exemple :
# ---------

# feature 'User delete', :devise, :js do

#   after(:each) do
#     Warden.test_reset!
#   end

#   scenario 'user can delete own account' do
#     #skip 'skip a slow test'
#     user = FactoryGirl.create(:user)
#     login_as(user, :scope => :user)
#     visit edit_user_registration_path(user)
#     click_button 'Suppression'
#    page.driver.browser.switch_to.alert.accept
#     expect(page).to have_content 'Votre compte a été supprimé avec succès.'
#   end

# end





