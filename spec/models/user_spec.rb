require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が正常に行なわれるとき' do
      it 'image、Email、Password、Password_confrimation、name、profile、が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'Passwordが6文字以上であれば登録できる' do
        @user.password = 'abcd123'
        @user.password_confirmation = 'abcd123'
        expect(@user).to be_valid
      end
      it 'Imageが存在しなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録が正常に行なわれないとき' do
      it 'Nameが空のときは登録できない' do
        @user.name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'Emailが空のときは登録できない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'Emailが既に登録されているものと重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれていない場合は登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'Passwordが空のときは登録できない' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'Passwordが存在しても、Password_confirmationが空のときは登録できない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'Passwordが半角英数字でないときは登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'Passwordが英字のみの場合は登録ができない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'Passwordが数字のみの場合は登録ができない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'Passwordが5文字以下の場合は登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'PasswordとPassword_confirmationが不一致の場合は登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'Profileが空のときは登録できない' do
        @user.profile = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end
  end
end
