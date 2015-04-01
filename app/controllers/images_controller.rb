class ImagesController < ApplicationController
  # include ActionController::Live

  def new
    @image = Image.new
    @album = Album.find_by(id: params[:album_id])
    if @album.write_authenticate(current_user)
      render partial: 'new'
    else
      render partial: 'prompt_for_password'
    end
  end

  def auth
    album = Album.find_by(id: params[:album_id])
    if album.write_authenticate(current_user, params[:album][:password])
      render partial: 'new'
    else
      @errors = "You entered an incorrect password"
      redirect_to :back
    end
  end

  def create

    cloudinary_hash = Cloudinary::Uploader.upload(params[:image][:image_url] || params[:image][:direct_url])

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
    @image = Image.find(params[:id])
  end

  def destroy
    Image.find_by(id: params[:id]).destroy
    redirect_to album_path(params[:album_id])
  end

  def tags
    client = Instagram.client(:access_token => ENV['IG_ACCESS_TOKEN'])
    @html = "<h1>Instagram pics with your album's Tag:</h1>"
    tags = client.tag_search(params[:tag])
    @html << "<h2>Tag Name = #{tags[0].name}. Pic Count =  #{tags[0].media_count}. </h2><br/><br/>"
    for media_item in client.tag_recent_media(tags[0].name)
      @html << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    @html
  end

  private

  def image_params
    params.require(:image).permit(:caption )
  end

end
