class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def new
    @memo = Memo.new
  end

  def index
    @memos = Memo.all.order('created_at DESC')
    @museums = Museum.all
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to museum_path(@memo.museum)
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @memo.user_id
  end

  def update
    if @memo.update(memo_params)
      redirect_to museum_memo_path(@memo.id)
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    redirect_to root_path
  end

  private

  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id, museum_id: params[:museum_id])
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end
end
