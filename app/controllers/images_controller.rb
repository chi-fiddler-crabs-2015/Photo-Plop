class ImagesController < ApplicationController
  # include ActionController::Live

  def new
    @user = current_user || User.new_guest
    @image = Image.new
    @album = Album.find_by(id: params[:album_id])
    if @album.write_authenticate(current_user)
      render partial: 'new'
    else
      render partial: 'prompt_for_password'
    end
  end

  def auth
    @album = Album.find_by(id: params[:album_id])
    if @album.write_authenticate(current_user, params[:album][:password])
      render partial: 'new'
    else
      @errors = "You entered an incorrect password"
      redirect_to :back
    end
  end

  def create
    if ( params[:image][:image_url] || params[:image][:direct_url] )
      cloudinary_hash = Cloudinary::Uploader.upload(params[:image][:image_url] || params[:image][:direct_url])

      @new_image = Album.find(params[:album_id]).images.new(caption: params[:image][:caption], owner: current_user)
      @new_image.location = cloudinary_hash["url"]
    else
      @new_image = Album.find(params[:album_id]).images.new(caption: params[:image][:caption], owner: current_user, location: params[:image][:location])
    end

    if @new_image.save
      redirect_to album_path(@new_image.album.id)
    else
      @errors = @new_image.errors
      render :'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    Image.find_by(id: params[:id]).destroy
    redirect_to album_path(params[:album_id])
  end

  def tags
    client = Instagram.client(:access_token => ENV['IG_ACCESS_TOKEN'])
    @instaInfo = Hash[]
    puts tags = client.tag_search(params[:tag])
    @instaInfo[:album] = Album.find_by(tag: params[:tag])
    @instaInfo[:TagName] = tags[0].name
    @instaInfo[:PicCount] = tags[0].media_count

    puts client.tag_recent_media(tags[0].name)
    @instaInfo[:ImgResults] = []
    for media_item in client.tag_recent_media(tags[0].name)
      @instaInfo[:ImgResults] << media_item.images.standard_resolution.url
    end
    @instaInfo
  end

  private

  def image_params
    params.require(:image).permit(:caption )
  end

end
