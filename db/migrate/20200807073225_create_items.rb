class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.string :derivery_fee, null:false
      t.string :size, null:false
      t.string :data, null:false
      t.string :brands_name
      t.integer :introduction, null:false
      t.string :sale_status, null:false
      t.integer :prefecture_id, null:false
      t.references :user,foreign_key:true
      t.references :category, null:false,foreign_key:true
      t.timestamps
    end
  end
end