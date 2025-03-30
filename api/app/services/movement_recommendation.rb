class MovementRecommendation < RecommendationStrategy
  RecommendationStrategy.register(:movement, self)
  
  def find(artwork)
    Artwork.where(movement_id: artwork.movement_id).where.not(id: artwork.id)
  end
end