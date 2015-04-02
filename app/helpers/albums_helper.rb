module AlbumsHelper
  def show_vanity_url(album)
    "http://photoplop.herokuapp.com/" + album.vanity_url
  end

  def random_public_album
    Album.where("read_privilege =  ? AND write_privilege = ?", 1, 1).sample
  end

  def mega_album
    @_mega_album ||= Album.find_by(title: "Mega Album!".downcase)
  end
end
