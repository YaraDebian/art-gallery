class ArtMovement < ApplicationRecord
  has_many :artworks
  has_many :artists, through: :artworks

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :period, presence: true
end
