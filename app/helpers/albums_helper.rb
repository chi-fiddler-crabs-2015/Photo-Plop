module AlbumsHelper
  def show_vanity_url(album)
    "http://photoplop.herokuapp.com/" + album.vanity_url
  end
end
