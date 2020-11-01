require 'rails_helper'
RSpec.describe Purchase, type: :model do
  describe "#create" do
    #let(:purchase)    { create(:purchase) }
    before do
      seller = create(:seller)
      item = create(:item, user_id: seller.id)
      buyer = create(:buyer)
      @purchase = build(:purchase,user_id: buyer.id,item_id: item.id )
    end
    it "is valid purchase" do
      expect(@purchase).to be_valid
    end
  end
end
