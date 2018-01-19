class Event < ApplicationRecord
    belongs_to :user
    has_one :availability
    has_many :availabilities, dependent: :destroy
    has_many :rsvps
    has_many :users_attending, through: :rsvps, source: 'user'
end
