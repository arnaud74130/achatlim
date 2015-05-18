class FncNotifier < ApplicationMailer
	def created(fnc, user)
		@fnc = fnc
		@user = user
		subject = "[ACHATLIM][FNC] Non conformité pour le marché "
		mail(to: user.mail, subject: subject)
	end
end
