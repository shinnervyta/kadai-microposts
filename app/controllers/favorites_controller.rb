class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.bookmark(micropost)
    flash[:success] = '投稿をお気に入りしました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unbookmark(micropost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_to root_url
  end
end
