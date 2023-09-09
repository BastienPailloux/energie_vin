class AddDefaultValueProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :profile, 'user'
  end
end
