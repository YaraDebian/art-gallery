require "sorbet-runtime"
require "typed_params"

module Api
  module V1
    class ArtworksController < ApplicationController
      def index
        @artworks = Artwork.includes(:artist, :art_movement).all
        render json: @artworks, include: [ :artist, :art_movement ]
      end

      def show
        artwork = Artwork.find(read_params.id)
        render json: artwork, include: [ :artist, :art_movement ]
      end

      def related_artworks
        artwork = Artwork.find(read_params.id)
        recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(artwork, :artist)
        recommendations += Recommendations::ArtworkRecommendationService.find_recommendations(artwork, :movement)
        recommendations += Recommendations::ArtworkRecommendationService.find_recommendations(artwork, :period)

        render json: recommendations, include: [ :artist, :art_movement ]
      end

      def create
        artwork = Artwork.new(create_params)

        if artwork.save
          render json: artwork, status: :created, include: [ :artist, :art_movement ]
        else
          render json: artwork.errors, status: :unprocessable_entity
        end
      end

      def update
        artwork = Artwork.find(update_params.id)
        if artwork.update(update_params)
          render json: artwork, include: [ :artist, :art_movement ]
        else
          render json: artwork.errors, status: :unprocessable_entity
        end
      end

      def destroy
        artwork = Artwork.find(destroy_params.id)
        artwork.destroy
        head :no_content
      end

      private

      class ReadParams < T::Struct
        const :id, Integer, factory: ->(val) { Integer(val) }
      end

      def read_params
        TypedParams[ReadParams].new.extract!(params)
      end

      class CreateParams < T::Struct
        const :title, String, factory: ->(val) { String(val) }
        const :description, String, factory: ->(val) { String(val) }
        const :year, Integer, factory: ->(val) { Integer(val) }
        const :image_url, String, factory: ->(val) { String(val) }
        const :artist_id, Integer, factory: ->(val) { Integer(val) }
        const :art_movement_id, Integer, factory: ->(val) { Integer(val) }
      end

      def create_params
        TypedParams[CreateParams].new.extract!(params)
      end

      class UpdateParams < T::Struct
        const :id, Integer, factory: ->(val) { Integer(val) }
        const :title, String, factory: ->(val) { String(val) }
        const :description, String, factory: ->(val) { String(val) }
        const :year, Integer, factory: ->(val) { Integer(val) }
      end

      class DestroyParams < T::Struct
        const :id, Integer, factory: ->(val) { Integer(val) }
      end

      def update_params
        TypedParams[UpdateParams].new.extract!(params)
      end

      def destroy_params
        TypedParams[DestroyParams].new.extract!(params)
      end
    end
  end
end
