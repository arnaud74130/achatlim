class Users::RegistrationsController < Devise::RegistrationsController
  #skip_before_filter :require_no_authentication

  autocomplete :entreprise, :nom, :extra_data => [:entreprise_type]


  def new
    @user=User.new
    super
  end

  def create
    @User = User.new(users_params)

    respond_to do |format|
      if @User.save
        format.html { redirect_to root_url, notice: 'Utilisateur ajouté.' }
      else
        format.html { render :new }
      end
    end
  end

  def users_params
    params.require(:user).permit(:nom, :prenom, :email, :password,:password_confirmation, :entreprise_id, :entreprise_type, :role)
  end

  def autocomplete_entreprise_nom
    term = params[:term]
    entreprises_etb = Etablissement.where('nom LIKE ?', "%#{term}%").order(:nom).all.to_a
    entreprises_f = Fournisseur.where('nom LIKE ?', "%#{term}%").order(:nom).all.to_a
    entreprises = entreprises_etb + entreprises_f
    render :json => entreprises.map { |entreprise| {id: entreprise.id, label: entreprise.nom, value: entreprise.nom, entreprise_type: entreprise.class.name} }
  end

end
