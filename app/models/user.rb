class User < ActiveRecord::Base

  enum role: [:etablissement, :fournisseur, :admin]

  after_initialize :set_default_role, :if => :new_record?
  belongs_to :entreprise, polymorphic: true
  validate :nom, presence: true

  def set_default_role
    self.role ||= :etablissement
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def entreprise_nom
    entreprise.nom if entreprise
  end

end
