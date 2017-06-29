class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.timestamp :datetime
      t.references :item, foreign_key: true
      t.references :status, foreign_key: true
      t.references :sector, foreign_key: true
      t.references :floor, foreign_key: true
      t.float :item_price

      t.timestamps
    end
  end
end
