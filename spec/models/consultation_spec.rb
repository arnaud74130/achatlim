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
RSpec.describe Consultation, :type => :model do
	it "contains etablissements" do
		consultation = FactoryGirl.create(:consultation)
		expect(5).to eq(consultation.etablissements.size)
	end
	
	it "contains markets" do
		consultation = FactoryGirl.create(:consultation)
		expect(4).to eq(consultation.markets.size)
	end
end
