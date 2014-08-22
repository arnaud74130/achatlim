class Etablissement < ActiveRecord::Base

	has_and_belongs_to_many :consultations
	has_many :users, as: :entreprise, dependent: :delete_all
	validates :nom, :presence => true
	
	before_save :pretty_name
	before_destroy {|etablissement| etablissement.consultations.clear}
	def pretty_name

		self.nom=nom.mb_chars.upcase.to_s unless self.nom.blank?
	end
end
