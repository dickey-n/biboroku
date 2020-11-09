require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe 'メモの投稿' do
    context '投稿ができる' do
      it 'memoが存在すれば投稿できる' do
        expect(@memo).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'memoが空のときは投稿できない' do
        @memo.memo = ' '
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Memo can't be blank")
      end
    end
  end
end
