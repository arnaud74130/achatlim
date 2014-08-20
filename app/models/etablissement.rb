class Etablissement < ActiveRecord::Base


	has_many :users, as: :entreprise, dependent: :delete_all
	validates :nom, :presence => true
	before_save :pretty_name

	def pretty_name

		self.nom=nom.mb_chars.upcase.to_s unless self.nom.blank?
	end
end
