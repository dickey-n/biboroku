class MuseumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @museums = Museum.all.order('created_at DESC').includes(:user)
  end

  def show
    @museum = Museum.find(params[:id])
    @memos = @museum.memos.includes(:user).order('created_at DESC')
  end

  def bookmarks
    @museums = current_user.bookmark_museums.includes(:user)
  end

  def search
    @museums = Museum.search(params[:keyword])
  end
end
