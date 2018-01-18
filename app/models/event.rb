class Event < ApplicationRecord
    belongs_to :user
    has_many :availabilities, dependent: :destroy
end
