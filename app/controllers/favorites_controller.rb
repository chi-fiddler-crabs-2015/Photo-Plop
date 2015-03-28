class FavoritesController < ApplicationController
  def create
    new_fav = Favorite.create(user_id: params[:user], album_id: params[:album])
    redirect_to albums_path(params[:album])
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to albums_path
  end


end
