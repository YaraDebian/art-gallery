require "sorbet-runtime"
require "typed_params"

class Api::V1::GalleriesController < ApplicationController
  def index
    galleries = Gallery.all
    if read_params.shared
      shared_galleries = current_user.shared_galleries
      render json: shared_galleries, include: [ :user, :artworks ]
    else
      render json: galleries, include: [ :user, :artworks ]
    end
  end

  def show
    gallery = Gallery.find(read_params.id)
    render json: gallery, include: [ :user, :artworks ]
  end

  def create
    gallery = Gallery.create(gallery_params)
    gallery.save
    render json: gallery, include: [ :user, :artworks ]
  end

  def update
    gallery = Gallery.find(update_params.id)
    gallery.update(gallery_params)
    render json: gallery, include: [ :user, :artworks ]
  end

  def share
    @sharing = Sharing.create(sharing_params)
    render json: @sharing, include: [ :user, :gallery ]
  end

  def destroy
    gallery = Gallery.find(destroy_params.id)
    gallery.destroy
    render json: { message: "Gallery deleted" }
  end

  private

  class GalleryParams < T::Struct
    const :name, String
    const :description, String
    const :image_url, String
    const :user_id, String
  end

  def gallery_params
    TypedParams[GalleryParams].new.extract!(params)
  end

  class ReadParams < T::Struct
    const :id, Integer, factory: ->(val) { Integer(val) }
    const :shared, Boolean, factory: ->(val) { Boolean(val) }
  end

  class UpdateParams < T::Struct
    const :id, Integer, factory: ->(val) { Integer(val) }
    const :name, String
    const :description, String
    const :image_url, String
  end

  class SharingParams < T::Struct
    const :user_id, Integer, factory: ->(val) { Integer(val) }
    const :gallery_id, Integer, factory: ->(val) { Integer(val) }
  end

  class DestroyParams < T::Struct
    const :id, Integer, factory: ->(val) { Integer(val) }
  end

  def read_params
    TypedParams[ReadParams].new.extract!(params)
  end

  def update_params
    TypedParams[UpdateParams].new.extract!(params)
  end

  def sharing_params
    TypedParams[SharingParams].new.extract!(params)
  end

  def destroy_params
    TypedParams[DestroyParams].new.extract!(params)
  end
end
