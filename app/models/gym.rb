class Gym < ApplicationRecord
  belongs_to :user
  has_many :photos
  
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
end
