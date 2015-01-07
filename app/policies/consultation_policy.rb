class ConsultationPolicy
	attr_reader :user, :consultation
	def initialize(user, consultation)
		@user = user
		@consultation = consultation
	end

	def index?
		true unless @user.visiteur? #all authenticate users can access index page
	end

	def new?
		@user.admin? || @user.etablissement?
	end

	def show?
		true unless @user.visiteur?		
	end

	def edit?
		true if @consultation.user_id == @user.id
	end

	def create?
		@user.admin? || @user.etablissement?
	end

	def update?
		true if @consultation.user_id == @user.id
	end

	def destroy?
		#true if @consultation.user_id == @user.id
		false
	end
end
