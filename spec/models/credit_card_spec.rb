require 'rails_helper'
describe CreditCard, type: :model do
  describe '#create' do
    it "user_id,customer_id,card_idが全て存在した時登録できる" do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user[:id])
      expect(credit_card).to be_valid
    end
    
    it "user_idがない時登録できない" do
      credit_card = build(:credit_card, user_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:user]).to include("must exist")
    end

    it "customer_idがない時登録できない" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end

    it "card_idがない時登録できない" do
      credit_card = build(:credit_card, card_id:nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("can't be blank")
    end
  end
end
