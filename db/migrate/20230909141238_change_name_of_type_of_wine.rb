class ChangeNameOfTypeOfWine < ActiveRecord::Migration[7.0]
  def change
    rename_column :bottles, :type, :wine_type
  end
end
