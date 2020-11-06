class BookmarksController < ApplicationController
  before_action :set_bookmark
  before_action :authenticate_user!

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.save
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, museum_id: params[:id])
    bookmark.destroy
  end

  def bookmark_params
    params.permit(:museum_id, :user_id).merge(user_id: current_user.id, museum_id: params[:museum_id])
  end

  def set_bookmark
    @museum = Museum.find(params[:museum_id])
  end
end
