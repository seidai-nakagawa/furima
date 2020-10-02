class ItemImage < ApplicationRecord
  belongs_to :item
  
  validates :item_id, presence: true
  mount_uploader :url, ImageUploader
end
