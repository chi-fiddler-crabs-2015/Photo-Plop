class ImagesController < ApplicationController
  include ActionController::Live

  def new
    @image = Image.new
  end

  def create
    puts "params are: "
    puts params

    @new_image = Album.find(params[:album_id]).images.new(image_params)

    if params[:image_url].present?
      cloudinary_hash = Cloudinary::Uploader.upload(params[:image_url])

      @new_image.file_url = cloudinary_hash["url"]

      # preloaded = Cloudinary::PreloadedFile.new(params[:image_url])
      # raise "Invalid upload signature" if !preloaded.valid?

      # puts "the preloaded is: "
      # puts preloaded

      # @new_image.file_url = preloaded.identifier

      # puts "file_url from cloudinary is: "
      # puts @new_image.file_url
    end

    if @new_image.save
      render :back
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
