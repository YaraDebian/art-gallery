module Api
  module V1
    class ArtMovementsController < ApplicationController
      # TODO: remove before_action add extract param as a Struct
      before_action :set_art_movement, only: [ :show, :update, :destroy ]
      # TODO: add signatures
      def index
        @art_movements = ArtMovement.all
        render json: @art_movements
      end

      def show
        render json: @art_movement
      end

      def create
        @art_movement = ArtMovement.new(art_movement_params)

        if @art_movement.save
          render json: @art_movement, status: :created
        else
          render json: @art_movement.errors, status: :unprocessable_entity
        end
      end

      def update
        if @art_movement.update(art_movement_params)
          render json: @art_movement
        else
          render json: @art_movement.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @art_movement.destroy
        head :no_content
      end

      private

      def set_art_movement
        @art_movement = ArtMovement.find(params[:id])
      end

      def art_movement_params
        params.require(:art_movement).permit(:name, :description, :period)
      end
    end
  end
end
