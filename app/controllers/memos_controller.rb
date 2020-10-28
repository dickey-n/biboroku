class MemosController < ApplicationController
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

  private
  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id, museum_id: params[:museum_id])
  end
end
