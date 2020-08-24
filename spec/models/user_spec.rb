require 'rails_helper'

  describe User do
  # RSpec.describe User, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    describe '#create' do
    
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      it "nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, name: "" )
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank", "is invalid")
      end

      it "passwordがない場合は登録できないこと" do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank", "is too short (minimum is 7 characters)", "is invalid")
      end

      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        user = FactoryBot.build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "重複したnameが存在する場合は登録できない" do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, name: user.name)
        another_user.valid?
        expect(another_user.errors[:name]).to include("has already been taken")
      end

      it "emailに@とドメインが存在する場合は登録できること " do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: "kkk@gmail.com")
        another_user.valid?
        expect(user).to be_valid
      end

      it "emailに@とドメインがない場合は登録できないこと " do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: "kkkgmail")
        another_user.valid?
        expect(another_user.errors[:email]).to include("is invalid")
      end

      it "重複したemailが存在する場合は登録できない" do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    
      it " passwordが7文字以上であれば登録できること " do
        user = FactoryBot.build(:user, password: "password0", password_confirmation: "password0")
        user.valid?
        expect(user).to be_valid
      end

      it " passwordが6文字以下であれば登録できないこと " do
        user = FactoryBot.build(:user, password: "passwo", password_confirmation: "password")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end
    end
  end
