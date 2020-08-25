require 'rails_helper'
  describe Item do
    describe '#create' do
      it "is valid with a name, price, status, size, data, introduction, prefecture_id, category_id, user_id" do
        # user = create(:user)
        # category = create(:category)
        item = FactoryBot.build(:item)
        expect(item).to be_valid
      end
    end
  end
