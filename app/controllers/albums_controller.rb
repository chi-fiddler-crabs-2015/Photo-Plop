class AlbumsController < ApplicationController
  # include ActionController::Live

  def index
    @owned_albums = current_user.albums

    @albums_added_images_to = []
    owned_images = Image.where(owner: current_user)
    owned_images.each do |image|
      @albums_added_images_to.push(image.album) unless  ( @albums_added_images_to.include?(image.album) || @owned_albums.include?(image.album) )
    end

    @fav_albums = []
    current_user.favorites.each do |fav|
      @fav_albums << fav.album if fav.favorite
    end
  end

  def new
    @album = Album.new
    # render partial: 'new'
  end

  def create
    new_album = current_user.albums.new(album_params)
    if new_album.save
      redirect_to album_path(new_album)
    else
      @errors = new_album.errors
      render :'new'
    end
  end

  def vanity
    @album = Album.find_by(vanity_url: params[:vanity_url])
    if @album
      redirect_to album_path(@album)
    else
      flash[:alert] = "HMM.. this album isn't real..."
      redirect_to root_path
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    if current_user
      @favorite = current_user.favorites.find_by(album_id: @album)
    end
    if @album.read_authenticate(current_user)
      render :show
    else
      render :prompt_for_password
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    album = Album.find_by(id: params[:id])
    album.update_attributes(album_params)

    if album.save
      redirect_to album_path(album)
    else
      @errors = album.errors
      render :edit
    end
  end

  def destroy
    Album.find_by(id: params[:id]).destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :vanity_url, :password, :read_privilege, :write_privilege)
  end

end

#     response.headers['Content-Type'] = 'text/event-stream'
#     sse = SSE.new(response.stream)
#     begin
#       Album.on_change do |data|
#         puts "HEY THIS WAS CALLED"
#         sse.write(data)
#       end
#     rescue IOError
#       # Client Disconnected
#     ensure
#       sse.close
#     end
