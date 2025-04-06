module Recommendations
  class ArtistRecommendation < RecommendationStrategy
    RecommendationStrategy.register(:artist, self)

    def find(artwork)
      Artwork.by_artist(artwork.artist_id).where.not(id: artwork.id)
    end
  end
end
