require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいく場合' do
      it 'すべての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'detailが空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end

      it 'state_idが空では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State を選択してください")
      end

      it 'delivery_idが空では出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery を選択してください")
      end

      it 'place_idが空では出品できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place を選択してください")
      end

      it 'dispatch_idが空では出品できない' do
        @item.dispatch_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Dispatch を選択してください")
      end

      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9_999_999より高い場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが半角数字以外では出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと出品できない' do
        item = Item.new(
        title: 'Sample Title',
        detail: 'Sample Detail',
        category_id: 2,
        state_id: 2,
        delivery_id: 2,
        place_id: 2,
        dispatch_id: 2,
        price: 1000,
        image: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.png'), 'image/png')
      )
      item.valid?
      expect(item.errors[:user]).to include('を入力してください')
      end 

    end
  end
end
