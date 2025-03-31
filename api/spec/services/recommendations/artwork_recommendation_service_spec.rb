require "rails_helper"

RSpec.describe Recommendations::ArtworkRecommendationService do
  describe "#find_recommendations" do
    let(:artist) { FactoryBot.create(:artist, name: "Artist 1") }
    let(:art_movement) { FactoryBot.create(:art_movement, name: "Movement 1") }
    let!(:artwork_1) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement, year: 1900) }

    context 'artist recommendations' do
      context "when the artwork is by the same artist" do
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement) }

        it "returns recommendations for an artwork" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :artist)
          expect(recommendations).to contain_exactly(artwork_2)
        end
      end

      context "when the artwork is by a different artist" do
        let(:artist_2) { FactoryBot.create(:artist, name: "Artist 2") }
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist_2, art_movement: art_movement) }

        it "returns an empty array" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :artist)
          expect(recommendations).to be_empty
        end
      end
    end

    context 'art movement recommendations' do
      context "when the artwork is by the same art movement" do
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement) }

        it "returns recommendations for an artwork" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :movement)
          expect(recommendations).to contain_exactly(artwork_2)
        end
      end

      context "when the artwork is by a different art movement" do
        let(:art_movement_2) { FactoryBot.create(:art_movement, name: "Movement 2") }
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement_2) }

        it "returns an empty array" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :movement)  
          expect(recommendations).to be_empty
        end
      end
    end

    context 'period recommendations' do
      context "when the artwork is by the same period" do
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement, year: 1900) }

        it "returns recommendations for an artwork" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :period)
          expect(recommendations).to contain_exactly(artwork_2)
        end
      end

      context "when the artwork is by a different period" do
        let!(:artwork_2) { FactoryBot.create(:artwork, artist: artist, art_movement: art_movement, year: 1800) }

        it "returns an empty array" do
          recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork_1, :period)
          expect(recommendations).to be_empty
        end
      end
    end
  end
end
