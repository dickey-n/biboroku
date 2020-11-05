class TopController < ApplicationController
  def index
    @all_museums = Museum.all
    @all_memos = Memo.all
    @part_museums = Museum.order("created_at DESC").first(6)
    @part_memos = Memo.order("created_at DESC").first(6)
  end
end
