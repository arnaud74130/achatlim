class Etablissement < ActiveRecord::Base

  validate :nom, presence: true
  has_many :users, as: :entreprise, dependent: :delete_all
  before_save :pretty_name
  
  def pretty_name
    self.nom=nom.mb_chars.upcase.to_s
  end
end
