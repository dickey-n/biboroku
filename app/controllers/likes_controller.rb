class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to root_path
  end

  private

  def like_params
    params.permit(:memo_id, :user_id).merge(user_id: current_user.id, memo_id: params[:memo_id])
  end
end
