class Observation < ActiveRecord::Base
  default_scope { order(:created_at)}
  belongs_to :user
  belongs_to :fnc
end