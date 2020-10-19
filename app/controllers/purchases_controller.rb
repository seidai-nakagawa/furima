class PurchasesController < ApplicationController
  require "payjp"

  def buy
    @item = Item.find(params[:item_id])

    if user_signed_in?
      @user = current_user
      if @user.card.present?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
        @card = Card.find_by(user_id: current_user.id)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)

        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      else
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end
  
  def pay
  end
end
