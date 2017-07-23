class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @count_favorites = current_user.favorites.count
    current_user.favorite(@micropost)
    #flash[:success] = 'お気に入りしました。'
    #redirect_to :back
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @count_favorites = current_user.favorites.count
    current_user.unfavorite(@micropost)
    #flash[:success] = 'お気に入り解除しました。'
    #redirect_to :back
  end
  
end
