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
