module Api
  module V1
    class ArtistsController < ApplicationController
      # TODO: remove before_action add extract param as a Struct
      before_action :set_artist, only: [ :show, :update, :destroy ]
      # TODO: add signatures
      def index
        @artists = Artist.includes(artworks: :art_movement).all
        render json: @artists, include: { artworks: { include: :art_movement } }
      end

      def show
        render json:  @artist, include: { artworks: { include: :art_movement } }
      end

      def create
        @artist = Artist.new(artist_params)

        if @artist.save
          render json: @artist, status: :created
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      def update
        if @artist.update(artist_params)
          render json: { artist: @artist, artworks: @artist.artworks.includes(:art_movement) }
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @artist.destroy
        head :no_content
      end

      private

      def set_artist
        @artist = Artist.find(params[:id])
      end

      def artist_params
        params.require(:artist).permit(:name, :biography, :birth_date, :death_date)
      end
    end
  end
end
