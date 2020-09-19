FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"加藤"}
    first_name            {"太郎"}
    family_name_furigana  {"カトウ"}
    first_name_furigana   {"タロウ"}
    birth_day             {"2010-01-01"}
    family_name_to_deliver  {"加藤"}
    first_name_to_deliver   {"太郎"}
    family_name_to_deliver_furigana {"カトウ"}
    first_name_to_deliver_furigana  {"タロウ"}
    post_code             {"0000000"}
    prefecture_id         {"13"}
    city_name             {"渋谷区道玄坂"}
    city_address          {"1丁目1-1"}
    building              {"新東京ビル"}
    phone_number          {"12345678901"}
  end
  
end