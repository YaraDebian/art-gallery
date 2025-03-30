module Recommendations
  class ArtistRecommendation < RecommendationStrategy
    RecommendationStrategy.register(:artist, self)

    def find(artwork)
      Artwork.where(artist_id: artwork.artist_id).where.not(id: artwork.id)
    end
  end
end