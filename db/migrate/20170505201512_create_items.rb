class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :alias
      t.string :describe
      t.string :bar_code
      t.integer :type
      t.references :sector, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
