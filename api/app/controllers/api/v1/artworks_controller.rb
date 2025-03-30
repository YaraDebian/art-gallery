module Api
  module V1
    class ArtworksController < ApplicationController
      before_action :set_artwork, only: [ :show, :update, :destroy ]

      def index
        @artworks = Artwork.includes(:artist, :art_movement).all
        render json: @artworks, include: [ :artist, :art_movement ]
      end

      def show
        render json: @artwork, include: [ :artist, :art_movement ]
      end

      def related_artworks
        @artwork = Artwork.find(params[:id])
        recommendations = Recommendations::ArtworkRecommendationService.find_recommendations(@artwork, :artist)
        recommendations += Recommendations::ArtworkRecommendationService.find_recommendations(@artwork, :movement)
        recommendations += Recommendations::ArtworkRecommendationService.find_recommendations(@artwork, :period)

        render json: recommendations, include: [ :artist, :art_movement ]
      end

      def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
          render json: @artwork, status: :created, include: [ :artist, :art_movement ]
        else
          render json: @artwork.errors, status: :unprocessable_entity
        end
      end

      def update
        if @artwork.update(artwork_params)
          render json: @artwork, include: [ :artist, :art_movement ]
        else
          render json: @artwork.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @artwork.destroy
        head :no_content
      end

      private

      def set_artwork
        @artwork = Artwork.find(params[:id])
      end

      def artwork_params
        params.require(:artwork).permit(:title, :description, :year, :image_url, :artist_id, :art_movement_id)
      end
    end
  end
end
