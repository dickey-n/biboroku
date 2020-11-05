class MuseumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @museums = Museum.all.order("created_at DESC")
  end

  def show
    @museum = Museum.find(params[:id])
    @memos = @museum.memos.includes(:user)
  end

end
