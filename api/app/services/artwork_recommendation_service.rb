class ArtworkRecommendationService
  def self.find_recommendations(artwork, type)
    strategy_class = RecommendationStrategy.all[type]
    raise ArgumentError, "Unknown recommendation type" unless strategy_class

    strategy = strategy_class.new
    strategy.find(artwork)
  end
end