class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.timestamps
      t.references :user,          foreign_key: true
      t.string :productname,       null: false
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :delivery_fee_id,  null: false
      t.integer :area_id,          null: false
      t.integer :delivery_time_id, null: false
      t.integer :price,            null: false
    end
  end
end
