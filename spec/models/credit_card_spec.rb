require 'rails_helper'

describe CreditCard do
  describe '#create' do
    it "user_id,customer_id,card_idが全て存在した時登録できる" do
      user = create(:user)
      credit_card = FactoryBot.build(:credit_card, user_id: user[:id])
      expect(credit_card).to be_valid
    end

    it "user_idがない時登録できない" do
      credit_card = build(:credit_card, user_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:user]).to include("を入力してください")
    end

    it "customer_idがない時登録できない" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない時登録できない" do
      credit_card = build(:credit_card, card_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")
    end
  end
end
