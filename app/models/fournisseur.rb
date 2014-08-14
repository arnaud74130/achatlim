class Fournisseur < ActiveRecord::Base

  before_save :pretty_name
  validate :nom, presence: true
  
  has_many :users, as: :entreprise, dependent: :delete_all

  def pretty_name
    self.nom=nom.mb_chars.upcase.to_s
  end
end
