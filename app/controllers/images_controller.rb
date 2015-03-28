class ImagesController < ApplicationController
  # include ActionController::Live

  def new
    @image = Image.new
  end

  def create

    cloudinary_hash = Cloudinary::Uploader.upload(params[:image][:image_url])

    @new_image = Album.find(params[:album_id]).images.new(caption: params[:image][:caption], owner: current_user)
    @new_image.location = cloudinary_hash["url"]

    if @new_image.save
      redirect_to album_path(@new_image.album.id)
    else
      @errors = @new_image.errors
      render :'new'
    end
  end

  def show
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image_url)
  end

end
