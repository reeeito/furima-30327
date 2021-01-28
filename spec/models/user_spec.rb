require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    # 下記OK
    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'lastnameが空では登録できないこと' do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'firstnameが空では登録できないこと' do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'lastname_kanaが空では登録できないこと' do
      @user.lastname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end

    it 'firstname_kanaが空では登録できないこと' do
      @user.firstname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'lastname_kanaが全角カタカナでなけれれば登録できないこと' do
      @user.lastname_kana = ('あいうえお')
      @user.valid?
      expect(@user.errors[:lastname_kana]).to include('is invalid')
    end

    it 'firstname_kanaが全角カタカナでなけれれば登録できないこと' do
      @user.firstname_kana = ('あいうえお')
      @user.valid?
      expect(@user.errors[:firstname_kana]).to include('is invalid')
    end

    # 登録できる
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end
    # 登録できる

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # 上記OK

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
