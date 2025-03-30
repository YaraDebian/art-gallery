class PeriodRecommendation < RecommendationStrategy
  RecommendationStrategy.register(:period, self)
  
  def find(artwork)
    Artwork.where(year: artwork.year).where.not(id: artwork.id)
  end
end