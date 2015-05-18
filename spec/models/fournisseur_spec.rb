require 'rails_helper'

RSpec.describe Fournisseur, :type => :model do
	it "ne peut pas creer deux noms similaires" do
		fournisseur = FactoryGirl.create(:fournisseur)	
		fournisseur2 = Fournisseur.create(nom: fournisseur.nom)
		expect(fournisseur2.valid?).to be false
		expect(fournisseur2.errors[:nom]).to include("n'est pas disponible")	
	end

end
