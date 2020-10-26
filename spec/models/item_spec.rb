require 'rails_helper'

describe Item do
  describe '#商品を保存する時' do

    # 1. validationがかかっている全カラムがが存在すれば登録できること
    it "is valid with a all culmn" do

      item = build(:item)
      expect(item).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # # 3. item_imagesが空では登録できないこと
    it "is invalid without a item_images" do
      item = build(:item)
      item.item_images = []
      item.valid?
      expect(item.errors[:item_images]).to include("を入力してください")
    end

    # 4. explanationが空では登録できないこと
    it "is invalid without a explanation" do
      item = build(:item, explanation: "")
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    # 5. state_idが空では登録できないこと
    it "is invalid without a state_id" do
      item = build(:item, state_id: "")
      item.valid?
      expect(item.errors[:state_id]).to include("を入力してください")
    end

    # 6. shipping_charge_idが空では登録できないこと
    it "is invalid without a shipping_charge_id" do
      item = build(:item, shipping_charge_id: "")
      item.valid?
      expect(item.errors[:shipping_charge_id]).to include("を入力してください")
    end

    # 7. shipping_date_idが空では登録できないこと
    it "is invalid without a shipping_date_id" do
      item = build(:item, shipping_date_id: "")
      item.valid?
      expect(item.errors[:shipping_date_id]).to include("を入力してください")
    end

    # 8. prefecture_id空では登録できないこと
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    # 9. priceが空では登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # 10. nameが41文字以上であれば登録できないこと
    it "is invalid with a name that has more than 41 characters " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    # 11. nameが40文字以下であれば登録できること
    it "is valid with a name that has less than 40 characters " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    # 12. explanationが1001文字以上であれば登録できないこと
    it "is invalid with a explanation that more than 1001 characters" do
      word = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLM"
      item = build(:item, explanation: word)
      item.valid?
      expect(item.errors[:explanation]).to include("は1000文字以内で入力してください")
    end
  
    # 13. explanationが1000文字以下であれば登録できること
    it "is valid with a explanation that less than 1000 characters" do
      word = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKL"
      item = build(:item, explanation: word)
      expect(item).to be_valid
    end

    # 14. size_idが空では登録できないこと
    it "is invalid without a size_id" do
      item = build(:item, size_id: "")
      item.valid?
      expect(item.errors[:size_id]).to include("を入力してください")
    end

  end
end