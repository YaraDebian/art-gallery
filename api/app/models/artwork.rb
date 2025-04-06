class Artwork < ApplicationRecord
  belongs_to :artist
  belongs_to :art_movement

  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true,
            format: {
              with: URI::DEFAULT_PARSER.make_regexp,
              message: "must be a valid URL"
            }

  scope :by_year, ->(year) { where(year: (year - 10)..(year + 10)) }
  scope :by_artist, ->(artist_id) { where(artist_id: artist_id) }
  scope :by_art_movement, ->(art_movement_id) { where(art_movement_id: art_movement_id) }
end

