class Etablissement < ActiveRecord::Base
  validates_presence_of :nom
  has_many :users, as: :entreprise, dependent: :delete_all
  #before_destroy {|etablissement| etablissement.consultations.clear}
  before_save :nom_upcase

  private
  def nom_upcase
    self.nom=nom.upcase
  end
end
