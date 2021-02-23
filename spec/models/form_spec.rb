require 'rails_helper'

RSpec.describe Form, type: :model do
   describe '#create' do
     before do
       @purchaseHistory = FactoryBot.build(:form)
     end

     context '商品が登録できる時' do
       it "保存ができること" do
         expect(@purchaseHistory).to be_valid
       end
     end

     context '商品が登録できない時' do
      it 'postal_codeが空では保存できないこと' do
        @purchaseHistory.postal_code = nil
        @purchaseHistory.valid?
        expect(@purchaseHistory.errors.full_messages).to include("Postal code can't be blank")
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

     end
  end
end
