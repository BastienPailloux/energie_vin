class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :condition
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
