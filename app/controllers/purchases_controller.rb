class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_card, :set_item, :set_send

  def index
    unless user_signed_in?
      redirect_to user_session_path
    end
    if @credit_card.blank?
      redirect_to credit_card_path(current_user)
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
      @card_brand = @default_card_information.brand
      @send_id = Address.where(user_id: current_user.id).first
      case @card_brand
      when "Visa"
        @card_src = "visa.gif"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      when "Discover"
        @card_src = "discover.gif"
      end
    end
  end

  def pay
    pay_card = CreditCard.find_by(user_id: current_user.id)
    if pay_card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
        amount: @item.price,
        customer: Payjp::Customer.retrieve(pay_card.customer_id),
        currency: "jpy"
      )
      redirect_to action: 'done'
    else
      redirect_to credit_card_path(current_user), alert: "クレジットカードを登録してください"
    end
  end

  layout "purchase"

  def done
    @item.update( buyer_id: current_user.id)
  end

  private

  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_send
    @address = Address.where(user_id: current_user.id).first
  end
end
