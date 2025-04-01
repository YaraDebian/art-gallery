class Gallery < ApplicationRecord
  belongs_to :user
  has_many :artworks
  has_many :sharings
  has_many :shared_users, through: :sharings, source: :user
end