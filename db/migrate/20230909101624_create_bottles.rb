class CreateBottles < ActiveRecord::Migration[7.0]
  def change
    create_table :bottles do |t|
      t.string :type
      t.string :name
      t.string :property
      t.integer :year

      t.timestamps
    end
  end
end
