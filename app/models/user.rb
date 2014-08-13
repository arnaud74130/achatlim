class User < ActiveRecord::Base
  belongs_to :entreprise, polymorphic: true
  validates_presence_of :entreprise, :nom

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  def entreprise_nom
    self.entreprise.nom if self.entreprise
  end
end
