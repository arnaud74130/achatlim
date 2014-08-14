class User < ActiveRecord::Base
  enum role: [:visiteur, :etablissement, :fournisseur, :admin]
  after_initialize :set_default_role, :if => :new_record?
  belongs_to :entreprise, polymorphic: true

  validates_presence_of :nom
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of   :password, :on=>:create
  validates_confirmation_of   :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true

  def set_default_role
    self.role ||= :visiteur
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :validatable, enlever car sinon on ne peut pas ajouter des validations supplémentaires...
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :confirmable
  def entreprise_nom
    entreprise.nom if entreprise
  end
end
