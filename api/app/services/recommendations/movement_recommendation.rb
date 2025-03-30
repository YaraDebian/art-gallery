module Recommendations
  class MovementRecommendation < RecommendationStrategy
    RecommendationStrategy.register(:movement, self)

    def find(artwork)
      Artwork.where(art_movement_id: artwork.art_movement_id).where.not(id: artwork.id)
    end
  end
end