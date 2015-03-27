class AlbumsController < ApplicationController

  def index
    @owned_albums = current_user.albums
    @contributed_albums = current_user.collaborators_albums.albums
  end

  def new
    @album = Album.new
  end

  def create
    new_album = current_user.albums.create(album_params)
    if new_album.valid?
      redirect_to album_path(new_album)
    else
      @errors = new_album.errors
      render :'new'
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :vanity_url, :password, :permissions)
  end

end
