class FamilleSegment < ActiveRecord::Base
	validates :libelle, presence: true, uniqueness: true
	has_and_belongs_to_many :point_livraisons
	has_and_belongs_to_many :consultations
end
