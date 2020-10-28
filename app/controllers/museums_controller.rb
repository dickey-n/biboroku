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
    @memo = Memo.new
    @memos = @museum.memos.includes(:user)
  end

  def edit
    @museum = Museum.find(params[:id])
    unless current_user.id == @museum.user_id
      redirect_to action: :index
    end
  end

  def update
    museum = Museum.find(params[:id])
    if museum.update(museum_params)
      redirect_to museum_path(museum.id)
    else
      render :edit
    end
  end

  def destroy
    museum = Museum.find(params[:id])
    museum.destroy
    redirect_to root_path
  end

  private
  def museum_params
    params.require(:museum).permit(:title, :place, :prefecture_id, :genre_id, :artist, :text, :image).merge(user_id: current_user.id)
  end
end
