class CreateAdminService
  def call
  	entreprise = Etablissement.find_or_create_by!(nom: "GRC")
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
    	user.nom = Rails.application.secrets.admin_name
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.confirmed_at = Date.today
        user.confirmation_sent_at = Date.today
        
        user.entreprise = entreprise
        user.admin!
      end
  end
end
