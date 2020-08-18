class CreditCardsController < ApplicationController

  require "payjp"

  def new
    credit_card = CreditCard.where(user_id: current_user.id)
    render :show if credit_card.exists?
  end

  def show
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_card.blank?
      render "no-card"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.credit_card.retrieve(credit_card.card_id)
      render "exit"
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        render "show"
      else
        render :new
      end
    end
  end

end
