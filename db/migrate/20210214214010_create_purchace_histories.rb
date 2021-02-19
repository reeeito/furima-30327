class CreatePurchaceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchace_histories do |t|
      t.references :user, null:false,foreign_key: true
      t.references :product, null:false,foreign_key: true
      t.timestamps
    end
  end
end
