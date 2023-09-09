class FixDecimalPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :sells, :price, :decimal, precision: 8, scale: 2
  end
end
