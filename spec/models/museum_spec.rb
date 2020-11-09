require 'rails_helper'

RSpec.describe Museum, type: :model do
  before do
    @museum = FactoryBot.build(:museum)
  end

  describe '展覧会の投稿' do
    context '投稿ができる' do
      it 'image、title、place、genre_id、prefecture_id、artist、textが存在すれば投稿できる' do
        expect(@museum).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'Imageが空のときは投稿できない' do
        @museum.image = nil
        @museum.valid?
        expect(@museum.errors.full_messages).to include("Image can't be blank")
      end
      it 'Titleが空のときは投稿できない' do
        @museum.title = ' '
        @museum.valid?
        expect(@museum.errors.full_messages).to include("Title can't be blank")
      end
      it 'Artistが空のときは投稿できない' do
        @museum.artist = ' '
        @museum.valid?
        expect(@museum.errors.full_messages).to include("Artist can't be blank")
      end
      it 'Textが空のときは投稿できない' do
        @museum.text = ' '
        @museum.valid?
        expect(@museum.errors.full_messages).to include("Text can't be blank")
      end
      it 'Genre_idで『--』を選択したときは投稿できない' do
        @museum.genre_id = 1
        @museum.valid?
        expect(@museum.errors.full_messages).to include('Genre Select')
      end
      it 'Prefecture_idで『--』を選択したときは投稿できない' do
        @museum.prefecture_id = 0
        @museum.valid?
        expect(@museum.errors.full_messages).to include('Prefecture Select')
      end
    end
  end
end
