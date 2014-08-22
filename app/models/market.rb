class Market < ActiveRecord::Base
  belongs_to :fournisseur
  belongs_to :consultation
  validates :code, presence: true
end
