class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates_date :start_date
  validates_date :end_date
  validates :start_date, :end_date, presence: true
  
  scope :chronological, -> { order('start_date DESC') }
end
