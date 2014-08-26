class ConsultationPolicy
	attr_reader :user, :consultation
	def initialize(user, consultation)
		@user = user
		@consultation = consultation
	end

	def index?
		true #all authenticate users can access index page
	end

	def new?
		@user.admin? || @user.etablissement?
	end

	def show?
		@user.admin? || @user.etablissement?
	end

	def edit?
		@user.admin? || @user.etablissement?
	end

	def create?
		@user.admin? || @user.etablissement?
	end

	def update?
		@user.admin? || @user.etablissement?
	end

	def destroy?
		@user.admin? || @user.etablissement?
	end
end
