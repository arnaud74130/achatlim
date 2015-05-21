class FncCreator
	attr_reader :fnc
	def self.build(scope, current_user, fnc_params)
		fnc = scope.new(fnc_params) 
    	fnc.etablissement_id=current_user.entreprise.id  
    	new(fnc, current_user)  		
	end
	
	def initialize(fnc, current_user)
		@fnc = fnc
		@current_user = current_user		
	end
	
	def save		
		if @fnc.save
			@fnc.fournisseur.users.each do |user|					
				FncNotifier.created(@fnc, user).deliver_later
			end
			if @fnc.market.consultation.etablissements.include? Etablissement.coordonnateur
				Etablissement.coordonnateur.users.each do |user|
					FncNotifier.notif_coordonnateur_created(@fnc,user).deliver_later
				end
			end
			true
		end		
	end

	def update(fnc_params)
		if @fnc.update(fnc_params)
			if @current_user.entreprise_type == 'Fournisseur'
				@fnc.etablissement.users.each do |user|
					FncNotifier.updated(@fnc, user).deliver_later
				end				
			else
				@fnc.fournisseur.users.each do |user|
					FncNotifier.updated(@fnc, user).deliver_later
				end
			end
			if @fnc.market.consultation.etablissements.include? Etablissement.coordonnateur							
				Etablissement.coordonnateur.users.each do |user|
					FncNotifier.notif_coordonnateur_updated(@fnc,user).deliver_later					
				end
			end
			true
		end
	end
	
end