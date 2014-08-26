class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def autocomplete_user_entreprise?
    @current_user.admin? ||  @current_user.etablissement?
  end
  def autocomplete_user_fournisseur?
    @current_user.admin? ||  @current_user.etablissement?
  end
  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

end
