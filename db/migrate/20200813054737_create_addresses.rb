class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_family_name, null:false
      t.string :address_first_name, null:false
      t.string :address_family_name_kana, null:false
      t.string :address_first_name_kana, null:false
      t.string :post_code, null:false
      t.string :prefecture, null:false
      t.string :municipality, null:false
      t.string :house_number, null:false
      t.string :building_name
      t.string :phone_number, unique:true
      t.references :user, null:false,foreign_key:true
      t.timestamps
    end
  end
end
