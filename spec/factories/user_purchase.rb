FactoryBot.define do
  #出品者データ
  factory :seller, class: User do
    sequence(:nickname)        { |i| "出品者_#{i}"}
    sequence(:email)           { |i| "seller_#{i}@test.com"}
    # nickname              {"abe"}
    # email {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_furigana  {"ヤマダ"}
    first_name_furigana   {"タロウ"}
    birth_day             {"2010-01-01"}
    family_name_to_deliver  {"加藤"}
    first_name_to_deliver   {"太郎"}
    family_name_to_deliver_furigana {"ヤマダ"}
    first_name_to_deliver_furigana  {"タロウ"}
    post_code             {"0000000"}
    prefecture_id         {"13"}
    city_name             {"渋谷区道玄坂"}
    city_address          {"1丁目1-1"}
    building              {"新東京ビル"}
    phone_number          {"12345678901"}
  end

  #購入者データ
  factory :buyer, class: User do
    sequence(:nickname)        { |i| "購入者_#{i}"}
    sequence(:email)           { |i| "byuer_#{i}@test.com"}
    # nickname              {"abe"}
    # email {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"佐藤"}
    first_name            {"次郎"}
    family_name_furigana  {"サトウ"}
    first_name_furigana   {"ジロウ"}
    birth_day             {"2010-01-01"}
    family_name_to_deliver  {"佐藤"}
    first_name_to_deliver   {"次郎"}
    family_name_to_deliver_furigana {"サトウ"}
    first_name_to_deliver_furigana  {"ジロウ"}
    post_code             {"0000000"}
    prefecture_id         {"13"}
    city_name             {"新宿区西新宿"}
    city_address          {"2丁目2-2"}
    building              {"新東京ビル"}
    phone_number          {"12345678901"}
  end
end 