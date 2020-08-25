class CreditCardsController < ApplicationController

  require "payjp"

  def new
    credit_card = CreditCard.where(user_id: current_user.id)
  end

  def show
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
      render "no-card"
    else
      Payjp.api_key = ENV[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(credit_card.card_id)
      @card_brand = @default_card_information.brand
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
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    end
  end

  def create
    Payjp.api_key = ENV[:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @credit_card.save
      redirect_to credit_card_path(current_user)
    end
  end

  def destroy
    @credit_card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(@credit_card.customer_id)
    customer.delete
    @credit_card.delete
    @credit_card.destroy
    redirect_to credit_card_path(current_user)
  end
end
