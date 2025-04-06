module Recommendations
  class MovementRecommendation < RecommendationStrategy
    RecommendationStrategy.register(:movement, self)

    def find(artwork)
      Artwork.by_art_movement(artwork.art_movement_id).where.not(id: artwork.id)
    end
  end
end
