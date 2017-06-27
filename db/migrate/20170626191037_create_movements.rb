class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.timestamp :datetime
      t.integer :id_item
      t.integer :id_status
      t.integer :id_sector
      t.integer :id_floor
      t.float :item_price

      t.timestamps
    end
  end
end
