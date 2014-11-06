#     AchatLim - Plateforme Collaborative Achat du Limousin
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

class User < ActiveRecord::Base
  default_scope {order('role').order('nom ASC')}

  enum role: [:visiteur, :etablissement, :fournisseur, :admin]
  after_initialize :set_default_role, :if => :new_record?
  belongs_to :entreprise, polymorphic: true
  has_one :consultation
  has_many :observations

  validates :nom, :telephone,  presence: true
  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of   :password, :on=>:create
  validates_confirmation_of   :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true
  validate :validate_entreprise_role, :on => :update
  before_save :pretty_records

  def set_default_role
    self.role ||= :visiteur
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :validatable, enlever car sinon on ne peut pas ajouter des validations supplémentaires...
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :confirmable
  def entreprise_nom
    if entreprise
      self.entreprise.nom=entreprise.nom.mb_chars.upcase.to_s unless self.nom.blank?
      self.entreprise.nom
    end
  end

  def full_name
    if prenom
      self.nom+" "+self.prenom
    else
      self.nom
    end
  end

  def pretty_records
    self.nom=nom.mb_chars.upcase.to_s unless self.nom.blank?
    self.prenom=prenom.titleize if self.prenom
  end

  def validate_entreprise_role
    if ((role == 'etablissement' && entreprise_type == 'Fournisseur') ||
        (role == 'fournisseur' && entreprise_type == 'Etablissement'))
      self.errors.add(:role, "Attention le rôle et l'entreprise sont incohérents.")
    end
  end

  #Add these two methods to your user model, devise should pick them up automatically - you should NOT need to extend Devise::SessionsController
  def active_for_authentication?
    super && self.is_active # i.e. super && self.is_active
  end

  def is_active
    self.active
  end

  def inactive_message
    "Votre compte est inactif !"
  end

  def destroy
    self.active=false    
    save!
  end
end
