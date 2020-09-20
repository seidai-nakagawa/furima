require 'rails_helper'

describe User do
  describe '#create' do

    # nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # ＠とドメインを含む必要があること
    it "is invalid without a @" do
      user = build(:user, email: "furimafurima.com")
      user.valid?
      expect(user.errors[:email]).to include("＠とドメインを含む必要があります")
    end

    it "is invalid without a domein" do
      user = build(:user, email: "furima@furimafurima")
      user.valid?
      expect(user.errors[:email]).to include("＠とドメインを含む必要があります")
    end

    # passwordが空では登録できないこと、7文字以上でないと登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "は7文字以上で入力してください")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    # family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    # family_nameが全角でないと登録できないこと
    it "is invalid if half width" do
      user = build(:user, family_name: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:family_name]).to include("全角のみで入力して下さい")
    end

    # first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    # first_nameが全角でないと登録できないこと
    it "is invalid if half width" do
      user = build(:user, first_name: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:first_name]).to include("全角のみで入力して下さい")
    end

    # family_name_furiganaが空では登録できないこと
    it "is invalid without a family_name_furigana" do
      user = build(:user, family_name_furigana: nil)
      user.valid?
      expect(user.errors[:family_name_furigana]).to include("を入力してください")
    end

    # family_name_furiganaが全角でないと登録できないこと
    it "is invalid if half width" do
      user = build(:user, family_name_furigana: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:family_name_furigana]).to include("全角ひらがな、全角カタカナのみで入力して下さい")
    end

    # first_name_furiganaが空では登録できないこと
    it "is invalid without a first_name_furigana" do
      user = build(:user, first_name_furigana: nil)
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("を入力してください")
    end

    # first_name_furiganaが全角でないと登録できないこと
    it "is invalid if half width" do
      user = build(:user, first_name_furigana: "ﾊﾝｶｸ")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("全角ひらがな、全角カタカナのみで入力して下さい")
    end

    # birth_dayが空では登録できないこと
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    # family_name_to_deliverが空では登録できないこと
    it "is invalid without a family_name_to_deliver" do
      user = build(:user, family_name_to_deliver: nil)
      user.valid?
      expect(user.errors[:family_name_to_deliver]).to include("を入力してください")
    end

    # first_name_to_deliverが空では登録できないこと
    it "is invalid without a first_name_to_deliver" do
      user = build(:user, first_name_to_deliver: nil)
      user.valid?
      expect(user.errors[:first_name_to_deliver]).to include("を入力してください")
    end

    # family_name_to_deliver_furiganaが空では登録できないこと
    it "is invalid without a family_name_to_deliver_furigana" do
      user = build(:user, family_name_to_deliver_furigana: nil)
      user.valid?
      expect(user.errors[:family_name_to_deliver_furigana]).to include("を入力してください")
    end

    # first_name_to_deliver_furiganaが空では登録できないこと
    it "is invalid without a first_name_to_deliver_furigana" do
      user = build(:user, first_name_to_deliver_furigana: nil)
      user.valid?
      expect(user.errors[:first_name_to_deliver_furigana]).to include("を入力してください")
    end

    # post_codeが空では登録できないこと
    it "is invalid without a post_code" do
      user = build(:user, post_code: nil)
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    # prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      user = build(:user, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    # city_nameが空では登録できないこと
    it "is invalid without a city_name" do
      user = build(:user, city_name: nil)
      user.valid?
      expect(user.errors[:city_name]).to include("を入力してください")
    end

    # city_addressが空では登録できないこと
    it "is invalid without a city_address" do
      user = build(:user, city_address: nil)
      user.valid?
      expect(user.errors[:city_address]).to include("を入力してください")
    end
  end
end

# buildingとphone_numberは任意