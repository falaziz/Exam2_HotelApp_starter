class User < ApplicationRecord
    before_save :reformat_phone
    
    has_many :bookings
    has_many :rooms, through: :bookings
    
    scope :alphabetical, -> { order(:last_name, :first_name) }
    scope :search, ->(n) { where('first_name LIKE ? OR last_name LIKE ?', "#{n}%", "#{n}%") }
    scope :active, -> { where(active: true) }
    
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.+-]+@[\w.]+\.(com|edu|gov|net|org)\z/i}
    validates :phone, format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/}
    
    
    def name
      "#{first_name} #{last_name}"
    end
    
    private 
    
    def reformat_phone
      ph = self.phone.to_s 
      ph.gsub(/[^0-9]/,'') 
      self.phone = ph
    end
    
end
