class FavoritesController < ApplicationController

  def index
    puts params
    puts "**************************"
    @album = Album.find_by(id: params[:album])
    @favorite = Favorite.find_or_create_by(user_id: params[:user], album_id: params[:album])
    @favorite.change_status
    @favorite.save
    render partial: 'button'
  end

  # def destroy
  #   Favorite.find(params[:id]).destroy
  #   redirect_to albums_path
  # end


end
