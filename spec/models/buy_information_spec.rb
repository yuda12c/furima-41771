require 'rails_helper'

RSpec.describe BuyInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_information = FactoryBot.build(:buy_information,user_id: user.id, item_id: item.id)
  end

  context '有効な場合' do
    it 'すべての必須項目が適切に入力されていれば有効' do
      expect(@buy_information).to be_valid
    end

    it '建物名がなくても有効' do
      @buy_information.building = nil
      expect(@buy_information).to be_valid
    end
  end

  context '無効な場合' do

    it 'user_idが空では購入できない' do
      @buy_information.user_id = nil
      @buy_information.valid?
      expect(@buy_information.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では購入できない' do
      @buy_information.item_id = nil
      @buy_information.valid?
      expect(@buy_information.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号が空では無効' do
      @buy_information.postal_code = nil
      expect(@buy_information).not_to be_valid
    end

    it '郵便番号が「3桁-4桁」の形式でない場合は無効' do
      invalid_postal_codes = ['1234567', '１２３-４５６７', '123-456', '1234-567']
      invalid_postal_codes.each do |invalid_code|
        @buy_information.postal_code = invalid_code
        expect(@buy_information).not_to be_valid
      end
    end

    it '都道府県が空では無効' do
      @buy_information.place_id = 1
      expect(@buy_information).not_to be_valid
    end

    it '市区町村が空では無効' do
      @buy_information.city = nil
      expect(@buy_information).not_to be_valid
    end

    it '番地が空では無効' do
      @buy_information.address = nil
      expect(@buy_information).not_to be_valid
    end

    it '電話番号が空では無効' do
      @buy_information.phone_number = nil
      expect(@buy_information).not_to be_valid
    end

    it '電話番号が10桁未満では無効' do
      @buy_information.phone_number = '090123456'
      expect(@buy_information).not_to be_valid
    end

    it '電話番号が11桁を超えると無効' do
      @buy_information.phone_number = '090123456789'
      expect(@buy_information).not_to be_valid
    end

    it '電話番号にハイフンが含まれると無効' do
      @buy_information.phone_number = '090-1234-5678'
      expect(@buy_information).not_to be_valid
    end

    it '電話番号が半角数字以外を含むと無効' do
      invalid_phone_numbers = ['０９０１２３４５６７８', 'abc12345678', '090 1234 5678']
      invalid_phone_numbers.each do |invalid_number|
        @buy_information.phone_number = invalid_number
        expect(@buy_information).not_to be_valid
      end
    end

    it 'tokenが空では登録できないこと' do
       @buy_information.token = nil
       @buy_information.valid?
       expect(@buy_information.errors.full_messages).to include("Token can't be blank")
     end
    end
  end
