class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :post_code, null:false
      t.string :municipality, null:false
      t.references :user, null:false,foreign_key:true
      t.timestamps
    end
  end
end
