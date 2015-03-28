class AlbumsController < ApplicationController
  # include ActionController::Live

  def index
    @owned_albums = current_user.albums
    @contributed_albums = []
    current_user.collaborators_albums.each do |album|
      @contributed_albums << album
    end
  end

  def new
    @album = Album.new
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

  def show
    @album = Album.find_by(id: params[:id])
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
    params.require(:album).permit(:title, :description, :vanity_url, :password, :permissions)
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
