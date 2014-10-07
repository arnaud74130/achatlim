class FournisseurPolicy
attr_reader :user, :fournisseur
	def initialize(user, fournisseur)
		@user = user
		@fournisseur = fournisseur
	end
end