class FncCreator
	attr_reader :fnc
	def self.build(scope, current_user, fnc_params)
		fnc = scope.new(fnc_params) 
    	fnc.etablissement_id=current_user.entreprise.id  
    	fnc  		
	end
	
	def initialize(fnc)
		@fnc = fnc
	end
	
	def save
		if @fnc.save
			#FncNotifier
		end		
	end

	def update(fnc_params)
		if @fnc.update(fnc_params)
			#ObervationNotifier
		else
			false
		end
	end
	
end