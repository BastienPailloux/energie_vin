class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.integer :price
      t.references :website, null: false, foreign_key: true
      t.references :bottle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
