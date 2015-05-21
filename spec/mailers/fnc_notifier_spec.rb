require "rails_helper"

 RSpec.describe FncNotifier, type: :mailer do
 	describe "created" do
		let(:consultation) {create(:consultation)}
		let(:fnc) {consultation.markets.first.fncs.first}
		let(:etablissement_user) {fnc.observations.first.user}
		let(:etablissement) {etablissement_user.entreprise}
		let(:fournisseur_user) {fnc.market.fournisseur.users.first}
		
		let(:email) do 
			FncNotifier.created(fnc, fournisseur_user)
		end

		let(:email_etb) do 
			FncNotifier.updated(fnc, etablissement_user)
		end
		
		let(:email_fournisseur) do 
			FncNotifier.updated(fnc, fournisseur_user)
		end
		it "envoi d'un mail au fournisseur pour la creation d'un FNC" do
			expect(email.to).to include fournisseur_user.email			
			expect(email.body.to_s).to include etablissement.nom
			expect(email.body.to_s).to include fnc.market.code			
		end

		it "envoi d'un mail à l'établissement lors de la maj du fournisseur" do
			expect(email_etb.to).to include etablissement_user.email			
			expect(email_etb.body.to_s).to include fnc.fournisseur.nom
			expect(email_etb.body.to_s).to include fnc.market.code		
		end

		it "envoi d'un mail au fournisseur lors de la maj de l'établissement" do
			expect(email_fournisseur.to).to include fournisseur_user.email			
			expect(email_fournisseur.body.to_s).to include fnc.etablissement.nom
			expect(email_fournisseur.body.to_s).to include fnc.market.code		
		end

 	end   
 end
