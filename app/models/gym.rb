class Gym < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}
  
  belongs_to :user, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :guest_reviews, dependent: :destroy
  has_many :calendars, dependent: :destroy
  
  geocoded_by :address_string
  after_validation :geocode, if: :address_string_changed?
  
  validates :gym_type, presence: true
  
  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
  
  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
