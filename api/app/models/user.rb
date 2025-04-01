class User < ApplicationRecord
  has_many :galleries
  has_many :artworks, through: :galleries
  has_many :sharings
  has_many :shared_galleries, through: :sharings, source: :gallery
end
