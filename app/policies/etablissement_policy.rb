class EtablissementPolicy
	attr_reader :user, :etablissement
	def initialize(user, etablissement)
		@user = user
		@etablissement = etablissement
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
