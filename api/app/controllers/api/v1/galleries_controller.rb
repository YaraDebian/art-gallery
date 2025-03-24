class Api::V1::GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.create(gallery_params)
  end

  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update(gallery_params)
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name, :description, :image_url, :user_id)
  end
end
