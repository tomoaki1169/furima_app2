class PurchasesController < ApplicationController
  require "payjp"

  def purchase
    @item = Item.find(params[:item_id])
    @images = @item.images.all
    if user_signed_in?
      @user = current_user
      if @user.credit_card.present?
        Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
        @credit_card = CreditCard.find_by(user_id: current_user.id)
        customer = Payjp::Customer.retrieve(@credit_card.customer_id)
        @customer_card = customer.cards.retrieve(@credit_card.card_id)
        @card_brand = @customer_card.brand
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
      else
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @images = @item.images.all
    if @item.purchase.present?
      redirect_to item_path(@item.id),alert: "売り切れています"
    else
      @item.with_lock do
        if current_user.credit_card.present?
          @credit_card = CreditCard.find_by(usser_id:current_user.id)
          Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
          charge = payjp::Charge.create(
            amount: @item.price,
            customer: Payjp::Customer,retrieve(@credit_card.customer_id),
            currency: "jpy"
          )
        else
          Payjp::Charge.create(
            amount: @item.price,
            card: params['payjp-token'],
            currency: 'jpy'
          )
        end
      @purchase = Purchase.create(buyer_id: current_user.id, item_id: params[:item_id])
      end
    end
  end

  def done
    
  end
end
