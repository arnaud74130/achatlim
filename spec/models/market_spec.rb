require 'rails_helper'

RSpec.describe Market, :type => :model do
it "contains fournisseur" do
		market = FactoryGirl.create(:market)
		expect(market.fournisseur).not_to be_nil 
	end
 end
