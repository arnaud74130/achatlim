# describe User do

#   before(:each) { @user = User.new(email: 'user@example.com') }

#   subject { @user }

#   it { should respond_to(:email) }

#   it "#email returns a string" do
#     expect(@user.email).to match 'user@example.com'
#   end

# end
require 'rails_helper'
RSpec.describe User, :type => :model do
	it "Un utilisateur effacé est inactif" do
		user = FactoryGirl.create(:user)
		id=user.id
		expect(user.active).to be true
		user.destroy
		retrieve_deleted_user = User.find(id)
		expect(retrieve_deleted_user).not_to be_nil
		expect(retrieve_deleted_user.active).to be false
	end


end
