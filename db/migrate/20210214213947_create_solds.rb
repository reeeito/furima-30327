class CreateSolds < ActiveRecord::Migration[6.0]
  def change
    create_table :solds do |t|

      t.timestamps
    end
  end
end
