class Gym < ApplicationRecord
  belongs_to :user
  
  validates :gym_type, presence: true
end
