require 'rails_helper'

RSpec.describe Form, type: :model do
   describe '#create' do
    before do
      @purchaseHistory = FactoryBot.build(:form)
    end
 
    it "保存ができること" do
      expect(@purchaseHistory).to be_valid
    end
   end
end
