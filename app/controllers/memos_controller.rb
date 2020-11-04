class MemosController < ApplicationController 
  def new
    @memo = Memo.new
  end

  def index
    @memos = Memo.all.order("created_at DESC")
    @museums = Museum.all
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to museum_path(@memo.museum)
    else
      @museum = @memo.museum
      @memos = @museum.memos
      render "museums/show"
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  private
  def memo_params
    params.permit(:memo).merge(user_id: current_user.id, museum_id: params[:museum_id])
  end
end
