class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  has_many :purchase_informations
  has_many :comments
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to_active_hash :size
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
end
