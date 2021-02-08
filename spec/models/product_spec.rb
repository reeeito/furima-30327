require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    context 'ユーザー登録ができる時' do
    it 'imageがあれば保存できる' do
      @product.image = fixture_file_upload('app/assets/images/card-amex.gif')
      @product.valid?
    end

    end
  context 'ユーザーが登録できない時' do

    it 'imageが空では保存できないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it 'productnameが空では登録できないこと' do
      @product.productname = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Productname can't be blank")
    end

    it 'explanationが空では登録できないこと' do
      @product.explanation = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Category is not a number')
    end

    it 'state_idが空では登録できないこと' do
      @product.state_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('State is not a number')
    end

    it 'delivery_fee_idが空では登録できないこと' do
      @product.delivery_fee_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery fee is not a number')
    end

    it 'area_idが空では登録できないこと' do
      @product.area_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Area is not a number')
    end

    it 'delivery_time_idが空では登録できないこと' do
      @product.delivery_time_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery time is not a number')
    end

    it 'priceが空では登録できないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300より下では保存できないこと' do
      @product.price = ('299')
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than 299')
    end

    it 'priceが¥9.999.999より上では保存できないこと' do
      @product.price = ('10,000,000')
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが半角英数混合では保存できないこと' do
      @product.price = ('aaa111')
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが半角英語では保存できないこと' do
      @product.price = ('aaaaaa')
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが全角では保存できないこと' do
      @product.price = ('９９９９')
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it 'category_idが1では登録できないこと' do
      @product.category_id = ('1')
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end

    it 'state_idが1では登録できないこと' do
      @product.state_id = ('1')
      @product.valid?
      expect(@product.errors.full_messages).to include('State must be other than 1')
    end

    it 'delivery_fee_idが1では登録できないこと' do
      @product.delivery_fee_id = ('1')
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery fee must be other than 1')
    end

    it 'area_idが1では登録できないこと' do
      @product.area_id = ('1')
      @product.valid?
      expect(@product.errors.full_messages).to include('Area must be other than 1')
    end

    it 'delivery_time_idが1では登録できないこと' do
      @product.delivery_time_id = ('1')
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery time must be other than 1')
    end

  end
  end
  end
