class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @museum = Museum.find(params[:id])
  end

  private
  def museum_params
    params.require(:museum).permit(:title, :place, :prefecture_id, :genre_id, :artist, :text, :image).merge(user_id: current_user.id)
  end
end
