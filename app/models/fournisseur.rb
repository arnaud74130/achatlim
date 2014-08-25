class Fournisseur < ActiveRecord::Base

	before_save :pretty_name
	validates :nom, presence: true

	has_many :users, as: :entreprise, dependent: :delete_all
	has_many :markets, dependent: :delete_all

	def pretty_name
		self.nom=nom.mb_chars.upcase.to_s if self.nom
	end

	def consultations
		markets.inject([]) do |consults, market|
			consults << market.consultation
			consults
		end
	end

end
