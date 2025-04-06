module Recommendations
  class PeriodRecommendation < RecommendationStrategy
    RecommendationStrategy.register(:period, self)

    def find(artwork)
      Artwork.by_year(artwork.year).where.not(id: artwork.id)
    end
  end
end
