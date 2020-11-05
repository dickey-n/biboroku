class TopController < ApplicationController
  def index
    @all_museums = Museum.all
    @part_museums = Museum.order("created_at DESC").first(6)
    @memos = Memo.order("created_at DESC").first(6)
  end
end
