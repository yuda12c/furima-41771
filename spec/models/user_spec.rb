require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  context '新規登録ができる場合' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録ができない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'testmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a1b2c'
      @user.password_confirmation = 'a1b2c'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数字混合でないと登録できない（数字のみ）' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが半角英数字混合でないと登録できない（英字のみ）' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password = 'a1b2c3'
      @user.password_confirmation = 'a1b2c4'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'surnameが空では登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'surnameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.surname = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid")
    end

    it 'nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid")
    end

    it 'surname_kanaが空では登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end

    it 'name_kanaが空では登録できない' do
      @user.name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank")
    end

    it 'surname_kanaがカタカナ以外では登録できない' do
      @user.surname_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana is invalid")
    end

    it 'name_kanaがカタカナ以外では登録できない' do
      @user.name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end