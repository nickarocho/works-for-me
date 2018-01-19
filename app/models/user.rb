class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true

    has_many :events
    has_many :approveds
    has_many :rsvps
    has_many :events_attending, through: :rsvps, source: 'event'
end
