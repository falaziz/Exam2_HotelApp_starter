class Room < ApplicationRecord
    has_many :bookings
    has_many :users, through: :bookings
    
    validates :room_type, presence: true, allow_nil: false
    validates :room_number, presence: true, numericality: { only_integer: true, 
        greater_than_or_equal_to: 100, less_than: 1000 }
    
    scope :booked, ->{where(booked: true)}
    scope :numerical, -> { order('room_number DESC') }
end
