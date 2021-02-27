require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('app/assets/images/card-amex.gif')
      @product.save
      @purchaseHistory = FactoryBot.build(:form, user_id: @user.id, product_id: @product.id)
      sleep 0.1
    end

    context '商品が登録できる時' do
      it '保存ができること' do
        expect(@purchaseHistory).to be_valid
      end

      it 'building_nameは空でも保存ができること' do
        building_name = nil
        expect(@purchaseHistory).to be_valid
      end

    end

    context '商品が登録できない時' do
      it 'postal_codeが空では保存できないこと' do
        @purchaseHistory.postal_code = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンなしでは保存できないこと' do
        @purchaseHistory.postal_code = ("00000000")
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Postal code is invalid")
      end

      it 'area_idが空では保存できないこと' do
        @purchaseHistory.area_id = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipaityが空では保存できないこと' do
        @purchaseHistory.municipaity = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Municipaity can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @purchaseHistory.address = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空では保存できないこと' do
        @purchaseHistory.tel = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが12桁では保存できないこと' do
        @purchaseHistory.tel = ("000000000000")
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが空英数字混合では保存できないこと' do
        @purchaseHistory.tel = ("000000aaaaaa")
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Tel is invalid")
      end      
      it 'area_idが1では登録できないこと' do
        @purchaseHistory.area_id = 1
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include('Area must be other than 1')
      end

      it 'tokenが空では保存できないこと' do
        @purchaseHistory.token = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存できないこと' do
        @purchaseHistory.user_id = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空では保存できないこと' do
        @purchaseHistory.product_id = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
