class Card < ApplicationRecord
  belongs_to :user
  validates :customer_id,:card_id, presence: true
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
end
