class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
  end

  def show
  end

  private

  def image_params
    params.require(:image).permit(:caption)
  end

end
