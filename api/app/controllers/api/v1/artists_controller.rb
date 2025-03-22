module Api
  module V1
    class ArtistsController < ApplicationController
      # TODO: remove before_action add extract param as a Struct
      before_action :set_artist, only: [ :show, :update, :destroy ]
      # TODO: add signatures
      def index
        @artists = Artist.all
        render json: @artists
      end

      def show
        render json: @artist
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
          render json: @artist
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
