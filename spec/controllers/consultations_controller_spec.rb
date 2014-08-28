require 'rails_helper'

RSpec.describe ConsultationsController, :type => :controller do
	before (:each) do
		@consultation =  create(:consultation)
		@eric = @consultation.etablissements.first.users.first
		@etb1 = @consultation.etablissements.first
		@etb2 = @consultation.etablissements.last
		@fournisseur1 = @consultation.markets.first.fournisseur
		@fournisseur2 = @consultation.markets.last.fournisseur

	end

	describe "GET #index" do
		it "renders the :index view if logged" do
			sign_in @eric
			get :index
			expect( response ).to render_template :index
		end
	end

	describe "creation de la consultation" do
		it "Fournisseur cannot access to form" do
			sign_in @fournisseur1.users.first
			get :new
			expect( response ).to  redirect_to(root_path)
		end

		# it "Etablissement can create" do
		# 	sign_in @eric
		# 	post :create
		# end
	end

end
