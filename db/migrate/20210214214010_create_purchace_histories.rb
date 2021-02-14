class CreatePurchaceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchace_histories do |t|

      t.timestamps
    end
  end
end
