class BookmarksController < ApplicationController
  before_action :museum_params
  before_action :authenticate_user!

  def create
    @bookmark = Bookmark.create(bookmark_params)
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, museum_id: params[:museum_id])
    bookmark.destroy
  end

  private

  def bookmark_params
    params.permit(:museum_id, :user_id).merge(user_id: current_user.id, museum_id: params[:museum_id])
  end

  def museum_params
    @museum = Museum.find(params[:museum_id])
  end
end
