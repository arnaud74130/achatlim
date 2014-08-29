class Fnc < ActiveRecord::Base
  has_many :observations  
  belongs_to :market
  accepts_nested_attributes_for :observations, allow_destroy: true
end
