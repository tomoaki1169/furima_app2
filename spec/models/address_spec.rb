require 'rails_helper'

RSpec.describe Address, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
   
    it "address_family_name,address_first_name,address_family_name_kana,address_first_name_kana,post_code,prefecture_id,municipality,house_numberが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "address_first_nameがない場合は登録できないこと" do
      address = build(:address, address_first_name: nil)
      address.valid?
      expect(address.errors[:address_first_name]).to include("全角で入力して下さい", "を入力してください")
    end


    it "address_family_nameがない場合は登録できないこと" do
      address = build(:address, address_family_name: nil)
      address.valid?
      expect(address.errors[:address_family_name]).to include("全角で入力して下さい", "を入力してください")
    end


    it "address_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_first_name_kana: nil)
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("全角カタカナのみで入力して下さい", "を入力してください")
    end


    it "address_family_name_kanaがない場合は登録できないこと" do
      address = build(:address, address_family_name_kana: nil)
      address.valid?
      expect(address.errors[:address_family_name_kana]).to include("全角カタカナのみで入力して下さい", "を入力してください")
    end


    it "post_codeがない場合は登録できないこと" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(sending_destination.errors[:post_code]).to include("は不正な値です", "を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("を入力してください")
    end
  

    it "house_numberがない場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end
  end
end
