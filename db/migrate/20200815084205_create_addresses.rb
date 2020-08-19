class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.string :city
      t.string :post_code, null:false
      t.string :municipality, null:false
      t.references :user, null:false,foreign_key:true

      t.timestamps
    end
  end
end
