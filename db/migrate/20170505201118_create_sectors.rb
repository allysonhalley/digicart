class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :alias
      t.string :describe
      t.integer :floor

      t.timestamps
    end
  end
end
