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
        redirect_to new_card_path, alert: "クレジットカードを登録してください"
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end
  
  def pay
    @item = Item.find(params[:item_id])

    if @item.purchases.present?
      redirect_to item_path(@item.id), alert: "売り切れています。"
    else
      @item.with_lock do
        if current_user.card.present?
          @card = Card.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          charge = Payjp::Charge.create(
          amount: @item.price,
          customer: Payjp::Customer.retrieve(@card.customer_id),
          currency: 'jpy'
          )
          redirect_to root_path, notice: "購入しました。"
        else
          Payjp::Charge.create(
          amount: @item.price,
          card: params['payjp-token'],
          currency: 'jpy'
          )
        end
      @purchase = Purchase.create(user_id: current_user.id, item_id: params[:item_id])
      end
    end
  end
end
