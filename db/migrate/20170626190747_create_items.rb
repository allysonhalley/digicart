class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :alias
      t.text :describe
      t.string :bar_code
      t.references :status, foreign_key: true
      t.references :sector, foreign_key: true
      t.references :type, foreign_key: true
      t.references :image, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
