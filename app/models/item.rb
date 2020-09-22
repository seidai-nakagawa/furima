class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
end
