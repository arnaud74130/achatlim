class Consultation < ActiveRecord::Base
	has_and_belongs_to_many :etablissements
	before_destroy {|consultation| consultation.etablissements.clear}
	has_many :markets, :dependent => :delete_all

	
	accepts_nested_attributes_for :markets, allow_destroy: true
	validates :code, presence: true

end
