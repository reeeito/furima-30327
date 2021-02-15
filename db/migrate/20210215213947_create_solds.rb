class CreateSolds < ActiveRecord::Migration[6.0]
  def change
    create_table :solds do |t|
      t.string     :postal_code,      null: false
      t.integer    :area_id,          null: false
      t.string     :municipaity,      null: false
      t.string     :address,          null: false
      t.string     :building_name
      t.string     :tel,              null: false
      t.references :purchace_history, foreign_key: true
      t.timestamps
    end
  end
end
