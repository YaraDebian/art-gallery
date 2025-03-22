class Artwork < ApplicationRecord
  belongs_to :artist
  belongs_to :art_movement

  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }
end
