class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.integer :item_id
      t.string :item
      t.string :sector
      t.string :floor
      t.string :status
      t.string :stock
      t.string :type
      t.datetime :moment

      t.timestamps
    end
  end
end
