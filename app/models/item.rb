class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :purchase_informations
  has_many :comments
  belongs_to :user
  belongs_to :category
  # belongs_to :brand
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
  validates_associated :item_images
  validates :item_images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :size_id, presence: true
  validates :state_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
end
