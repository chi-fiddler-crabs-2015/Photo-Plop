class FavoritesController < ApplicationController

  def create
    fav = Favorite.find_or_create_by(user_id: params[:user], album_id: params[:album])
    fav.change_status
    # redirect_to albums_path(params[:album])
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to albums_path
  end


end
