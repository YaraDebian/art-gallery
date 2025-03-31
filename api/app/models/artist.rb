class Artist < ApplicationRecord
  has_many :artworks
  has_many :art_movements, through: :artworks

  validates :name, presence: true
  validates :biography, presence: true
  validates :birth_date, presence: true
  validate :death_date_after_birth_date, if: -> { death_date.present? }

  private

  def death_date_after_birth_date
    if death_date <= birth_date
      errors.add(:death_date, "must be after birth date")
    end
  end
end


