class EtablissementPolicy
attr_reader :user, :etablissement
	def initialize(user, etablissement)
		@user = user
		@etablissement = etablissement
	end
end