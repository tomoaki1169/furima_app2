class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.integer :derivery_fee, null:false
      t.integer :size, null:false
      t.integer :data, null:false
      t.string :brands_name
      t.string :introduction, null:false
      t.integer :status, null:false
      t.integer :prefecture_id, null:false
      t.references :user,foreign_key:true
      t.references :category, null:false,foreign_key:true
      t.references :buyer
      t.timestamps
    end
  end
end