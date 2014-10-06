class FncPolicy
	attr_reader :user, :fnc
	def initialize(user, fnc)
		@user = user
		@fnc = fnc
	end

	def index?
		true #all authenticate users can access index page
	end

	def show?
		true
	end

	def new?
		@user.admin? || @user.etablissement?
	end

	def edit?
		true
	end

	def create?
		@user.admin? || @user.etablissement?
	end

	def update?
		true
	end

	def destroy?
		false
	end
end
