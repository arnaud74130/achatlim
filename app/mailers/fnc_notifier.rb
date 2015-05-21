class FncNotifier < ApplicationMailer
	
	def created(fnc, user)			
		@fnc = fnc
		@user = user
		subject = "[ACHATLIM] #{@user.entreprise.nom} vient de déclarer une fiche de non conformité"		
		mail(to: user.email, subject: subject)
	end

	def updated(fnc, user)
		@fnc = fnc
		@user = user
		subject = "[ACHATLIM] #{@user.entreprise.nom} vient de répondre à la non conformité ..."
		mail(to: user.email, subject: subject)
	end

	def notif_coordonnateur_created(fnc,user)
		@fnc = fnc
		subject = "[ACHATLIM] [FNC] déclaration de :#{@fnc.observations.first.user.entreprise.nom}, marché #{@fnc.market.code}"		
		mail(to: user.email, subject: subject)
	end
	def notif_coordonnateur_updated(fnc,user)
		@fnc = fnc
		subject = "[ACHATLIM][FNC] réponse de #{@fnc.observations.last.user.entreprise.nom}"		
		mail(to: user.email, subject: subject)
	end
end
