require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  describe '#create' do
   before do
     @purchaseHistory = FactoryBot.build(:purchase_history)
   end

   it "保存ができること" do
     expect(@purchaseHistory).to be_valid
   end
  end
end
