class Api::V1::GalleriesController < ApplicationController
  before_action :set_gallery, only: [ :show, :update, :destroy ]

  def index
    @galleries = Gallery.all
    render json: @galleries, include: [ :user, :artworks ]
  end

  def show
    @gallery = Gallery.find(params[:id])
    render json: @gallery, include: [ :user, :artworks ]
  end

  def create
    @gallery = Gallery.create(gallery_params)
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)
    render json: @gallery, include: [ :user, :artworks ]
  end

  def share
    @sharing = Sharing.create(sharing_params)
    render json: @sharing, include: [ :user, :gallery ]
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    render json: { message: "Gallery deleted" }
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name, :description, :image_url, :user_id)
  end

  def sharing_params
    params.require(:sharing).permit(:user_id, :gallery_id)
  end
end
