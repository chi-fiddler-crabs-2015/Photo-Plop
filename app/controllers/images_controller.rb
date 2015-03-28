class ImagesController < ApplicationController
  include ActionController::Live

  def new
    @image = Image.new
  end

  def create
    new_image = Album.find(params[:album_id]).images.create(image_params)
    if new_image.valid?
      render :back
    else
      @errors = new_image.errors
      render :'new'
    end
  end

  def show
  end

  private

  def image_params
    params.require(:image).permit(:caption)
  end

end
