class FournisseurPolicy
	attr_reader :user, :fournisseur
	def initialize(user, fournisseur)
		@user = user
		@fournisseur = fournisseur
	end

	def index?
		true unless @user.visiteur?
	end

	def show?
		true unless @user.visiteur?
	end

	def new?
		@user.admin?
	end

	def edit?
		@user.admin?
	end

	def create?
		@user.admin?
	end

	def update?
		@user.admin?
	end

	def destroy?
		@user.admin?
	end
end
