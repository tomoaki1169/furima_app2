class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name#, null:false
      t.integer :price#, null:false
      t.string :derivery_fee#, null:false
      t.string :size#, null:false
      t.string :status#, null:false
      t.string :data#, null:false
      t.string :area#, null:false
      t.string :introduction#, null:false
      t.references :user#, null:false,foreign_key:true
      t.references :brand#, null:false,foreign_key:true
      t.references :category#, null:false,foreign_key:true
      t.timestamps
    end
  end
end