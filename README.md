# README

## usersテーブル
| Column                          | Type     | Options                                |
| ------------------------------- | -------- | -------------------------------------- |
| nickname                        | string   | null: false, unique: true, index: true |
| email                           | string   | null: false, unique: true, index: true |
| encrypted_password              | string   | null: false                            |
| family_name                     | string   | null: false                            |
| first_name                      | string   | null: false                            |
| family_name_furigana            | string   | null: false                            |
| first_name_furigana             | string   | null: false                            |
| birth_day                       | data     | null: false                            |
| family_name_to_deliver          | string   | null: false                            |
| first_name_to_deliver           | string   | null: false                            |
| family_name_to_deliver_furigana | string   | null: false                            |
| first_name_to_deliver_furigana  | string   | null: false                            |
| post_code                       | string   | null: false                            |
| prefecture_id                   | integer  | null: false                            | (active_hash) |
| city_name                       | string   | null: false                            |
| city_address                    | string   | null: false                            |
| building                        | string   |                                        |
| phone_number                    | string   |                                        |

### Association
- has_many :sold_items, foreign_key: 'seller_id', class_name: 'Item'
- has_many :bought_items, foreign_key: 'buyer_id', class_name: 'Item'
- has_many :items
- has_many :comments
- has_one :credit_card, dependent: :destroy
- belongs_to_active_hash :prefecture


## items テーブル
| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| name                | string     | null: false, index: true       |
| price               | integer    | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | references | null: false, foreign_key: true |
| brand_id            | references | null: false, foreign_key: true |
| size_id             | integer    | null: false                    | (active_hash)
| state_id            | integer    | null: false                    | (active_hash)
| shipping_charge_id  | integer    | null: false                    | (active_hash)
| shipping_date_id    | integer    | null: false                    | (active_hash)
| prefecture_id       | integer    | null: false                    | (active_hash)
| buyer_id            | references | foreign_key: true              |
| seller_id           | references | null: false, foreign_key: true |

### Association
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :size
- belongs_to_active_hash :state
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :prefecture
- belongs_to :seller, class_name: “User”
- belongs_to :buyer, class_name: “User”, optional: true
<!-- 上記２行によりuserテーブルの「id」とitemsテーブルの「buyer_id」「seller_id」が紐づく -->


## comments テーブル（中間テーブル）
| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| comment             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## brands テーブル
| Column   | Type   | Options  |
| -------- | ------ | -------- |
| name     | string |          |

### Association
- has_many :items


## categories テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| ancestry  | string | null: false |
<!-- ancestryはgem追加必要  -->

### Association
- has_many :items


## item_imags テーブル
|Column  | Type       | Options                        |
| ------ | ---------- | -----------------------------  |
|url     | string     | null: false                    |
|item    | references | null: false, foreign_key: true |

### Association
- belongs_to :item


## credit_cards テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_token     | integer    | null: false, unique: true      |
| customer_token | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to: user
