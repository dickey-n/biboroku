class Admin::MuseumsController < ApplicationController
  before_action :if_not_admin
  before_action :set_museum, only: [:edit, :update, :destroy]

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

  def edit
    redirect_to action: :index unless current_user.id == @museum.user_id
  end

  def update
    if @museum.update(museum_params)
      redirect_to museum_path(@museum.id)
    else
      render :edit
    end
  end

  def destroy
    @museum.destroy
    redirect_to root_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def museum_params
    params.require(:museum).permit(:title, :place, :prefecture_id, :genre_id, :artist, :text, :image).merge(user_id: current_user.id)
  end

  def set_museum
    @museum = Museum.find(params[:id])
  end
end
