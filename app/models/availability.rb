class Availability < ApplicationRecord
  belongs_to :event
  has_many :approveds
end
