class LikesController < ApplicationController
  before_action :set_like
  before_action :authenticate_user!

  def create
    @like = Like.create(like_params)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, memo_id: params[:id])
    like.destroy
  end

  private

  def like_params
    params.permit(:memo_id, :user_id).merge(user_id: current_user.id, memo_id: params[:memo_id])
  end

  def set_like
    @memo = Memo.find(params[:memo_id])
  end
end
