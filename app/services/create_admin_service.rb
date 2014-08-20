class CreateAdminService
  def call
  	entreprise = Etablissement.find_or_create_by!(nom: "GRC", adresse_ligne1: "4 avenue de la révolution",
      ville: "Limoges", code_postal: "87000", telephone: "05.44.00.00.44", fax: "05.55.58.74.49")
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
    	user.nom = Rails.application.secrets.admin_name
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.telephone ="05.44.00.00.44"
        user.confirmed_at = Date.today
        user.confirmation_sent_at = Date.today
        
        user.entreprise = entreprise
        user.admin!
      end
  end
end
