#     AchatLim - Plateforme Collaborative Achat du Limousin
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#                         
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
