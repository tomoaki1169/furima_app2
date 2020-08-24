require 'rails_helper'

  describe Address do
  # RSpec.describe Address, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    describe '#create' do
    
      it "address_family_name,address_first_name,address_family_name_kana,address_first_name_kana,post_code,prefecture_id,municipality,house_numberが存在すれば登録できること" do
        address = FactoryBot.build(:address)
        expect(address).to be_valid
      end

      it "address_first_nameがない場合は登録できないこと" do
        address = FactoryBot.build(:address, address_first_name: nil)
        address.valid?
        expect(address.errors[:address_first_name]).to include("全角で入力して下さい", "can't be blank")
      end


      it "address_family_nameがない場合は登録できないこと" do
        address = FactoryBot.build(:address, address_family_name: nil)
        address.valid?
        expect(address.errors[:address_family_name]).to include("全角で入力して下さい", "can't be blank")
      end


      it "address_first_name_kanaがない場合は登録できないこと" do
        address = FactoryBot.build(:address, address_first_name_kana: nil)
        address.valid?
        expect(address.errors[:address_first_name_kana]).to include("全角カタカナのみで入力して下さい", "can't be blank")
      end


      it "address_family_name_kanaがない場合は登録できないこと" do
        address = FactoryBot.build(:address, address_family_name_kana: nil)
        address.valid?
        expect(address.errors[:address_family_name_kana]).to include("全角カタカナのみで入力して下さい", "can't be blank")
      end


      it "post_codeがない場合は登録できないこと" do
        address = FactoryBot.build(:address, post_code: nil)
        address.valid?
        expect(address.errors[:post_code]).to include("is invalid", "can't be blank")
      end

      it "prefecture_idがない場合は登録できないこと" do
        address = FactoryBot.build(:address, prefecture_id: nil)
        address.valid?
        expect(address.errors[:prefecture_id]).to include()
      end
    

      it "house_numberがない場合は登録できないこと" do
        address = FactoryBot.build(:address, house_number: nil)
        address.valid?
        expect(address.errors[:house_number]).to include("can't be blank")
      end
    end
  end
