class Gym < ApplicationRecord
  belongs_to :user
  has_many :photos
  
  validates :gym_type, presence: true
end
