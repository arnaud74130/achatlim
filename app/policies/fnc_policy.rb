class FncPolicy
	attr_reader :user, :fnc
	def initialize(user, fnc)
		@user = user
		@fnc = fnc
	end

	def index?
		true unless @user.visiteur? #all authenticate users can access index page
	end

	def show?
		true unless @user.visiteur?
	end

	def new?
		@user.admin? || @user.etablissement?
	end

	def edit?
		unless @fnc.cloturee
		 	true unless @user.visiteur?
		 end
	end

	def create?
		@user.admin? || @user.etablissement?
	end

	def update?
		 unless @fnc.cloturee
		 	true unless @user.visiteur?
		 end
	end

	def destroy?
		false
	end
end
